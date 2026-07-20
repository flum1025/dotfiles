return {
  "potamides/pantran.nvim",
  config = function()
    require("pantran").setup({
      default_engine = "google",
      engines = {
        google = {
          fallback = {
            default_source = "en",
            default_target = "ja",
          },
        },
      },
      controls = {
        mappings = {
          edit = {
            n = {
              ["S"] = require("pantran.ui.actions").switch_languages,
              ["e"] = require("pantran.ui.actions").select_engine,
              ["s"] = require("pantran.ui.actions").select_source,
              ["t"] = require("pantran.ui.actions").select_target,
              ["<C-y>"] = require("pantran.ui.actions").yank_close_translation,
              ["g?"] = require("pantran.ui.actions").help,
            },
            i = {
              ["<C-y>"] = require("pantran.ui.actions").yank_close_translation,
              ["<C-t>"] = require("pantran.ui.actions").select_target,
              ["<C-s>"] = require("pantran.ui.actions").select_source,
              ["<C-e>"] = require("pantran.ui.actions").select_engine,
              ["<C-S>"] = require("pantran.ui.actions").switch_languages,
            },
          },
          select = {},
        },
      },
    })
  end,
}
