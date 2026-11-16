---@type LazySpec
return {
  -- AstroNvim v6 は mason-tool-installer があると mason-lspconfig の ensure_installed を無視するため、
  -- LSP サーバーもここに mason のパッケージ名で並べる
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "golangci-lint-langserver",
        "gopls",
        "typescript-language-server",
        "vtsls",
        "vue-language-server",
        "html-lsp",
        "graphql-language-service-cli",
        "yaml-language-server",
        "terraform-ls",
        "rust-analyzer",
        "jedi-language-server",
        "json-lsp",
        "dockerfile-language-server",
        "sqlls",
        "css-lsp",
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
