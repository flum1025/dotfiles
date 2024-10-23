---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    formatting = {
      format_on_save = {
        enabled = true,
      },
      timeout_ms = 5000,
    },
    config = {
      golangci_lint_ls = {
        cmd = { "go", "run", "github.com/nametake/golangci-lint-langserver@latest", "-debug" },
        init_options = {
          command = {
            "go",
            "run",
            "github.com/golangci/golangci-lint/cmd/golangci-lint",
            "run",
            "--out-format",
            "json",
            "--issues-exit-code=1",
          },
        },
      },
      ts_ls = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
        },
        root_dir = require("lspconfig").util.root_pattern { "package.json", "node_modules" },
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.expand "$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
      },
      volar = {
        filetypes = { "vue" },
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      },
    },
  },
}
