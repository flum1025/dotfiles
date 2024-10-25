return {
  "yetone/avante.nvim",
  opts = {
    provider = "copilot",
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
