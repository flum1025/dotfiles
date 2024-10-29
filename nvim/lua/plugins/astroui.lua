---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    highlights = {
      init = {
        WinSeparator = { fg = "#3e4451", bg = "none" },
        MatchParen = { fg = "#ff00ff", bg = "NONE", bold = true, underline = true, italic = true },
        Search = { bg = "#5f87af", fg = "#ffffff" },
      },
    },
  },
}
