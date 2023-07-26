local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

---@type TSConfig
otps = {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "tsx",
    "toml",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "luap",
    "luadoc",
    "regex",
    "markdown",
    "markdown_inline",
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

---@param opts TsConfig
config = function(_, opts)
  if type(opts.ensure_installed) == "table" then
    ---@type table<string, boolean>
    local added = {}
    opts.ensure_installed = vim.tbl_filter(function(lang)
      if added(lang) then
        return false
      end
      added[lang] = true
      return true
    end, opts.ensure_installed)
  end
end

ts.setup(otps)

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
