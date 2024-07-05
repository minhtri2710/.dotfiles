return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent")

      transparent.clear_prefix("BufferLine")
      transparent.clear_prefix("NeoTree")
      transparent.clear_prefix("lualine")
    end,
  },
}
