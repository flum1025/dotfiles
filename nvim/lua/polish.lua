local function load_project_config()
  local project_config = vim.fn.getcwd() .. "/.nvim.lua"
  if vim.fn.filereadable(project_config) == 1 then dofile(project_config) end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = load_project_config,
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function() _G.set_terminal_keymaps() end,
})
