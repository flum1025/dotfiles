return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup {
      providers = {
        openai = {
          disable = true,
        },
        copilot = {
          disable = false,
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
        ollama = {
          disable = false,
          endpoint = "http://localhost:11434/v1/chat/completions",
        },
      },
      agents = {
        {
          name = "ChatOllamaLlama3.1-8B",
          disable = true,
        },
        -- {
        --   provider = "ollama",
        --   name = "OllamaLlama3.2-3B",
        --   chat = true,
        --   command = true,
        --   model = {
        --     model = "llama3.2",
        --     temperature = 0.6,
        --     top_p = 1,
        --     min_p = 0.05,
        --   },
        --   system_prompt = require("gp.defaults").chat_system_prompt,
        -- },
        {
          provider = "ollama",
          name = "OllamaCodestral-22B",
          chat = true,
          command = true,
          model = {
            model = "codestral",
            temperature = 0.5,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "ollama",
          name = "OllamaLlama-3-ELYZA-JP-8B",
          chat = true,
          command = true,
          model = {
            model = "hf.co/elyza/Llama-3-ELYZA-JP-8B-GGUF",
            temperature = 0.5,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      },
    }
  end,
}
