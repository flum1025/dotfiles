---@type LazySpec
return {
  "yetone/avante.nvim",
  init = function()
    vim.keymap.set("n", "<Leader>ac", ":AvanteChat<CR>", { desc = "AvanteChat" })
    vim.keymap.set("n", "<Leader>aa", ":AvanteAsk<CR>", { desc = "AvanteAsk" })
    vim.keymap.set("n", "<Leader>at", ":AvanteToggle<CR>", { desc = "AvanteToggle" })

    local location = vim.fn.getenv "AVANTE_LOCATION"
    local project_id = vim.fn.getenv "AVANTE_PROJECT_ID"
    local cloudsdk_active_config_name = vim.fn.getenv "AVANTE_CLOUDSDK_ACTIVE_CONFIG_NAME"

    vim.fn.setenv("LOCATION", location)
    vim.fn.setenv("PROJECT_ID", project_id)
    vim.fn.setenv("CLOUDSDK_ACTIVE_CONFIG_NAME", cloudsdk_active_config_name)
  end,
  opts = {
    -- provider = "copilot",
    provider = "vertex_claude",
    auto_suggestions_provider = "copilot",
    cursor_applying_provider = "copilot",
    behaviour = {
      auto_suggestions = false,
      enable_cursor_planning_mode = true,
    },
    web_search_engine = {
      provider = "google",
    },
    rag_service = {
      enabled = false,
    },
    providers = {
      vertex_claude = {
        endpoint = "https://LOCATION-aiplatform.googleapis.com/v1/projects/PROJECT_ID/locations/LOCATION/publishers/anthropic/models",
        model = "claude-sonnet-4@20250514",
      },
      bedrock = {
        model = "apac.anthropic.claude-sonnet-4-20250514-v1:0",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0,
          max_tokens = 8000,
        },
      },
      copilot = {
        model = "claude-4-sonnet",
      },
      vertex = {
        model = "gemini-1.5-flash",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0,
          max_output_tokens = 8000,
        },
      },
    },
    -- mappings = {
    --   suggestion = {
    --     accept = "<C-b>",
    --     next = "<C-j>",
    --     prev = "<C-k>",
    --     dismiss = "<C-]>",
    --   },
    -- },
  },
}
