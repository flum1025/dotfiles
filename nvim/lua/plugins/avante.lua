---@type LazySpec
return {
  "yetone/avante.nvim",
  init = function()
    local env_get_command = os.getenv "ENV_GET_COMMAND" or ""

    local function exec_command_async(cmd, callback)
      if cmd == "" then
        callback ""
        return
      end

      local job = require "plenary.job"
      job
        :new({
          command = "sh",
          args = { "-c", cmd },
          on_exit = function(j, return_val)
            if return_val == 0 then
              local result = table.concat(j:result(), "\n")
              callback(result:gsub("[\n\r]+$", ""))
            else
              callback ""
            end
          end,
        })
        :start()
    end

    local function get_env_value(env_output, var_name)
      for line in env_output:gmatch "[^\r\n]+" do
        local name, value = line:match "^([^=]+)=(.*)$"
        if name == var_name then return value end
      end
      return ""
    end

    local update_aws_credentials_async = function(silent, callback)
      local notify_done = callback or function() end

      exec_command_async(env_get_command, function(env_output)
        local aws_access_key_id = get_env_value(env_output, "AWS_ACCESS_KEY_ID")
        local aws_secret_access_key = get_env_value(env_output, "AWS_SECRET_ACCESS_KEY")
        local aws_session_token = get_env_value(env_output, "AWS_SESSION_TOKEN")

        vim.schedule(function()
          vim.env.BEDROCK_KEYS = table.concat({
            aws_access_key_id,
            aws_secret_access_key,
            "us-west-2",
            aws_session_token,
          }, ",")

          if not silent then vim.notify("AWS認証情報が更新されました", vim.log.levels.INFO) end
          notify_done()
        end)
      end)
    end

    vim.api.nvim_create_user_command("UpdateAWSCredentials", function() update_aws_credentials_async(false) end, {
      desc = "AWS認証情報を最新の値に更新します（非同期）",
    })

    local avante_command_entered = false

    vim.api.nvim_create_autocmd("CmdlineChanged", {
      callback = function()
        local cmd = vim.fn.getcmdline()
        if cmd:match "^Avante" then
          avante_command_entered = true
        else
          avante_command_entered = false
        end
      end,
    })

    vim.api.nvim_create_autocmd("CmdlineLeave", {
      callback = function()
        if avante_command_entered then
          update_aws_credentials_async(false)
          avante_command_entered = false
        end
      end,
    })
  end,
  opts = {
    -- provider = "copilot",
    provider = "bedrock",
    auto_suggestions_provider = "copilot",
    copilot = {
      model = "claude-3.7-sonnet",
    },
    behaviour = {
      auto_suggestions = false,
      enable_cursor_planning_mode = true,
    },
    web_search_engine = {
      provider = "google",
    },
    rag_service = {
      enabled = true,
    },
    bedrock = {
      model = "us.anthropic.claude-3-7-sonnet-20250219-v1:0",
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 8000,
    },
    -- mappings = {
    --   suggestion = {
    --     accept = "<C-b>",
    --     next = "<C-j>",
    --     prev = "<C-k>",
    --     dismiss = "<C-]>",
    --   },
    -- },
    vendors = {
      ["ollama-codestral"] = {
        ["local"] = true,
        endpoint = "127.0.0.1:11434/v1",
        model = "codestral",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
              ["x-api-key"] = "ollama",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
              max_tokens = 2048,
              stream = true,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
      },
      ["ollama-llama"] = {
        ["local"] = true,
        endpoint = "127.0.0.1:11434/v1",
        model = "hf.co/elyza/Llama-3-ELYZA-JP-8B-GGUF",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
              ["x-api-key"] = "ollama",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
              max_tokens = 2048,
              stream = true,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
      },
    },
  },
}
