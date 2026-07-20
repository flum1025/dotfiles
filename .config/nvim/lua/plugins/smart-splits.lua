return {
  {
    "mrjones2014/smart-splits.nvim",
    opts = function(_, opts)
      opts.ignore_buftypes = {
        "terminal",
        "nofile",
        'quickfix',
        'help',
        'prompt',
      }
      opts.resize_mode = {
        silent = true,
      }
      opts.resize_mode.hooks = {
        on_enter = function()
          vim.notify("Resize mode entered", vim.log.levels.INFO)
        end,
        on_leave = function()
          vim.notify("Resize mode exited", vim.log.levels.INFO)
        end,
      }
      return opts
    end,
  },
  {
    "astrocore",
    opts = {
      mappings = {
        n = {
          ["<C-w>r"] = { function() require("smart-splits").start_resize_mode() end, desc = "Start resize mode" },
        },
      },
    },
  },
}
