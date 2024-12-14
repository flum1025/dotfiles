---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    enabled = true,
  },
  {
    "keaising/im-select.nvim",
    config = function() require("im_select").setup {} end,
  },
  {
    "thinca/vim-quickrun",
    config = function() vim.api.nvim_set_keymap("n", "<Leader>r", "<Plug>(quickrun)", {}) end,
  },
  {
    "glidenote/memolist.vim",
    config = function()
      vim.g.memolist_path = "$HOME/memolist"
      vim.g.memolist_memo_suffix = "md"

      vim.keymap.set("n", "<Leader>mn", ":MemoNew<CR>", { desc = "New Memo" })
      vim.keymap.set("n", "<Leader>ml", ":MemoList<CR>", { desc = "List Memos" })
      vim.keymap.set("n", "<Leader>mg", ":MemoGrep<CR>", { desc = "Grep Memos" })
    end,
  },
  {
    "nicwest/vim-camelsnek",
  },
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_maps = {
        ["Visual All"] = "<C-d>",
        ["Select All"] = "<C-d>",
      }
    end,
  },
  {
    "echasnovski/mini.align",
    version = "*",
    init = function() require("mini.align").setup() end,
  },
  {
    "AndrewRadev/switch.vim",
    keys = {
      { "-", ":Switch<CR>", mode = "n", desc = "Switch" },
    },
  },
}
