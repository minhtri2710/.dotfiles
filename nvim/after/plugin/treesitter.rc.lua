local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

otps = {
  highlight = {
    enable = true,

  },
  indent = {
    enable = true,

  },
  ensure_installed = {
    "javascript",
    "tsx",
    "regex",
    "typescript",
    "toml",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "luadoc",
    "luap",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = "false",
      node_decremental = "<bs>",
    }
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

config = function(_, opts)
  if type(opts.ensure_installed) == "table" then
    --@type table<string, boolean>
    local added = {}
    opts.ensure_installed = vim.tbl_filter(function(lang)
      if added[lang] then
        return false
      end
      added[lang] = true
      return true
    end, opts.ensure_installed)
  end
end

ts.setup(otps)

-- Troubleshooting for window users
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting
require 'nvim-treesitter.install'.compilers = { "clang", "cc", "zig" }
require 'nvim-treesitter.install'.prefer_git = false

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
