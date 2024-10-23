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
        pplx = {
          disable = true,
          endpoint = "https://api.perplexity.ai/chat/completions",
          secret = os.getenv "PPLX_API_KEY",
        },
      },
    }
  end,
}
