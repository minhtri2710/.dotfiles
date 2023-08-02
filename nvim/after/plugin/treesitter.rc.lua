local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

if (vim.fn.has "win32") then
  local tsi = require 'nvim-treesitter.install'
  tsi.prefer_git = false
  tsi.compilers = { "clang", "gcc" }
end
---@type TSConfig
local otps = {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "toml",
    "php",
    "html",
    "json",
    "yaml",
    "css",
    "luap",
    "luadoc",
    "regex",
    "markdown",
    "markdown_inline",
  },
  auto_install = fasle,
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = fasle,
      node_decremental = "<bs>",
    }
  }
}

ts.setup(otps)

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
