return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        gitcommit = true,
        markdown = true,
        text = true,
      },
      panel = { enabled = false },
    },
    init = function()
      vim.api.nvim_set_keymap(
        "i",
        "<C-b>",
        "<cmd>lua require('copilot.suggestion').accept()<CR><CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
