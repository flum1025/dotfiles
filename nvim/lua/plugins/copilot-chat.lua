return {
  "CopilotC-Nvim/CopilotChat.nvim",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "gitcommit",
      once = true,
      callback = function()
        local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

        if first_line == nil or first_line == "" then
          local chat = require "CopilotChat"
          chat.open()
          chat.ask(
            "Generate a concise and meaningful commit message title based on the changes made. Make sure the title has maximum 50 characters. Do not put quotes around the title. Focus solely on creating the title, not the full commit message body.",
            {
              selection = function(source) return require("CopilotChat.select").gitdiff(source, true) end,
              callback = function(response)
                chat.close()
                vim.api.nvim_buf_set_lines(0, 0, 1, false, { response })
              end,
            }
          )
        end
      end,
    })
  end,
}
