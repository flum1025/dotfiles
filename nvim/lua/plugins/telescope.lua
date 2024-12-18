return {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function() require("telescope").load_extension "live_grep_args" end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require "telescope.actions"
      local lga_actions = require "telescope-live-grep-args.actions"

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-u>"] = function()
              local current_line = vim.fn.getline "."
              local new_line = current_line:sub(1, #current_line - #current_line)
              vim.fn.setline(".", new_line)
            end,
            ["<C-a>"] = function() vim.fn.cursor(0, 0) end,
            ["<C-e>"] = function() vim.fn.cursor(0, vim.fn.col "$") end,
          },
        },
      })
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-G><C-G>"] = actions.to_fuzzy_refine,
            },
          },
        },
      })
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require "telescope.builtin"

      opts.defaults.vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      }

      -- ファイル検索コマンドをripgrepに設定
      vim.env.FZF_DEFAULT_COMMAND = "rg --files -uu"

      vim.keymap.set(
        "n",
        "<leader>fo",
        function()
          require("telescope.builtin").oldfiles {
            cwd_only = true,
          }
        end,
        { desc = "Find recent files (current dir)" }
      )

      vim.keymap.set(
        "n",
        "<leader>fl",
        function() require("telescope").extensions.live_grep_args.live_grep_args() end,
        { desc = "Live grep" }
      )

      vim.keymap.set("n", "g,re", function() require("telescope.builtin").grep_string() end, { desc = "Live grep" })

      vim.keymap.set("v", "g,re", function()
        function get_visual_selection()
          local s_start = vim.fn.getpos "'<"
          local s_end = vim.fn.getpos "'>"
          local n_lines = math.abs(s_end[2] - s_start[2]) + 1
          local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
          lines[1] = string.sub(lines[1], s_start[3], -1)
          if n_lines == 1 then
            lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
          else
            lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
          end
          return table.concat(lines, "\n")
        end
        require("telescope.builtin").grep_string { search = get_visual_selection() }
      end, { desc = "Live grep" })
    end,
  },
}
