---@type LazySpec
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "golangci_lint_ls",
        "gopls",
        "ts_ls",
        "vtsls",
        "volar",
        "html",
        "graphql",
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
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "stylelint",
        "stylua",
        "prettier",
        "trivy",
        "eslint_d",
        "debugpy",
      },
    },
  },
}
