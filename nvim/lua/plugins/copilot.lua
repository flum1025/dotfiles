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
          accept = "<C-b>",
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
  },
}
