---@type LazySpec
return {
  "neo-tree.nvim",
  opts = function()
    return {
      filesystem = {
        window = {
          mappings = {
            ["/"] = "noop",
            -- Jump to current nodes parent
            -- like `p` in NERDTree Mappings
            ["P"] = function(state)
              local tree = state.tree
              local node = tree:get_node()
              local parent_node = tree:get_node(node:get_parent_id())
              local renderer = require "neo-tree.ui.renderer"
              renderer.redraw(state)
              renderer.focus_node(state, parent_node:get_id())
            end,
            ["T"] = { "toggle_preview", config = { use_float = true } },
          },
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    }
  end,
}
