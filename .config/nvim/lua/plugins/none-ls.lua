---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      require "none-ls.diagnostics.eslint_d",
      require "none-ls.formatting.eslint_d",
      require "none-ls.code_actions.eslint_d",
      null_ls.builtins.diagnostics.stylelint.with {
        filetypes = { "vue", "css", "scss" },
      },
      null_ls.builtins.formatting.stylelint.with {
        filetypes = { "vue", "css", "scss" },
      },
    })
  end,
}
