---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "dc00bb5910805744811647373ef1e6db9c9f8a6e",
    opts = {
      ensure_installed = {
        "lua_ls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "stylelint_lsp",
        "ts_ls",
        "vtsls",
        "volar",
        "html",
        "yamlls",
        "terraformls",
        "rust_analyzer",
        "jedi_language_server",
        "jsonls",
        "dockerls",
        "sqlls",
        "cssls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "trivy",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
