local function load_project_config()
  local project_config = vim.fn.getcwd() .. "/.nvim.lua"
  if vim.fn.filereadable(project_config) == 1 then dofile(project_config) end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = load_project_config,
})
