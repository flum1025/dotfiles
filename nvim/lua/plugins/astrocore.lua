---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        relativenumber = false,
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 0,
        wrap = true,
        linebreak = true,
        showbreak = "↳ ",
        whichwrap = "b,s,h,l,<,>,[,]",
        startofline = true,
        ignorecase = false,
        smartcase = false,
      },
      g = {
        omni_sql_no_default_maps = false,
      },
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<leader>fo"] = {
          function()
            require("telescope.builtin").oldfiles {
              cwd_only = true,
            }
          end,
          desc = "Find recent files (current dir)",
        },
        ["<leader>tr"] = {
          function() require("astrocore").toggle_term_cmd "irb" end,
          desc = "ToggleTerm ruby",
        },
        [":jq"] = { ":%!jq '.'<CR>", desc = "Format JSON with jq" },
        ["<leader>yp"] = {
          function()
            local path = vim.fn.expand "%"
            vim.fn.setreg("+", path)
            vim.notify("Yanked: " .. path)
          end,
          desc = "Yank file path",
        },
        ["<leader>yz"] = {
          function()
            local path = vim.fn.expand "%:p"
            vim.fn.setreg("+", path)
            vim.notify("Yanked: " .. path)
          end,
          desc = "Yank file path",
        },
        ["<leader>yf"] = {
          function()
            local filename = vim.fn.expand "%:t"
            vim.fn.setreg("+", filename)
            vim.notify("Yanked: " .. filename)
          end,
          desc = "Yank file name",
        },

        ["s"] = { "<Nop>", desc = "Disable s key" },
        ["sj"] = { "<C-w>j", desc = "Move to window below" },
        ["sk"] = { "<C-w>k", desc = "Move to window above" },
        ["sl"] = { "<C-w>l", desc = "Move to window right" },
        ["sh"] = { "<C-w>h", desc = "Move to window left" },
        ["sJ"] = { "<C-w>J", desc = "Move window down" },
        ["sK"] = { "<C-w>K", desc = "Move window up" },
        ["sL"] = { "<C-w>L", desc = "Move window right" },
        ["sH"] = { "<C-w>H", desc = "Move window left" },
        ["sn"] = { "gt", desc = "Next tab" },
        ["sp"] = { "gT", desc = "Previous tab" },
        ["sr"] = { "<C-w>r", desc = "Rotate windows" },
        ["s="] = { "<C-w>=", desc = "Equalize window sizes" },
        ["sw"] = { "<C-w>w", desc = "Switch windows" },
        ["so"] = { "<C-w>_<C-w>|", desc = "Maximize window" },
        ["sN"] = { "<cmd>bn<CR>", desc = "Next buffer" },
        ["sP"] = { "<cmd>bp<CR>", desc = "Previous buffer" },
        ["st"] = { "<cmd>tabnew<CR>", desc = "New tab" },
        ["ss"] = { "<cmd>sp<CR>", desc = "Split window horizontally" },
        ["sv"] = { "<cmd>vs<CR>", desc = "Split window vertically" },
        ["sq"] = { "<cmd>q<CR>", desc = "Quit window" },
        ["sQ"] = { "<cmd>bd<CR>", desc = "Close buffer" },
        ["<leader>fz"] = { ":Neotree reveal<CR>", desc = "Reveal file in Neotree" },
      },
      i = {
        ["<S-Tab>"] = { "<C-d>", desc = "Unindent line" },
      },
      v = {
        -- disable avante keymaps
        ["co"] = { "<Nop>" },
        ["ct"] = { "<Nop>" },
        ["ca"] = { "<Nop>" },
        ["c0"] = { "<Nop>" },
        ["cb"] = { "<Nop>" },
        ["cc"] = { "c" },
      },
    },
  },
}
