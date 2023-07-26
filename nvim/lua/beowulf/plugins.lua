local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'svrana/neosolarized.nvim',
    dependencies = {
      'tjdevries/colorbuddy.nvim'
    }
  },
  {
    'hrsh7th/nvim-cmp', -- Completion
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',    -- LuaSnip
      'hrsh7th/cmp-nvim-lsp',        -- Nvim-Cmp Source for Neovim's built-in LSP
      'hrsh7th/cmp-buffer',          -- Nvim-Cmp Source for Buffers Words
      'rafamadriz/friendly-snippets' -- Friendly Snippets
    }
  },
  'nvim-lualine/lualine.nvim', -- StatusLine
  'nvim-lua/plenary.nvim',     -- Common Utilities
  'onsails/lspkind-nvim',      -- VSCode-Like Pictograms
  {
    'neovim/nvim-lspconfig',   -- LSP
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = true
      },
      'williamboman/mason-lspconfig.nvim'
    }
  },
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions and more via Lua
  'glepnir/lspsaga.nvim',            -- LSP UIs
  {
    'nvim-tree/nvim-web-devicons',   -- File Icons
    lazy = true
  },
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  'norcalli/nvim-colorizer.lua',
  'folke/zen-mode.nvim',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim', -- For Git blame & browse
  'MunifTanjim/prettier.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    cmd = "TSUpdateSync",
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end
  },
  -- Indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "nvim-treesitter/playground",
})
