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
  'nvim-lualine/lualine.nvim', -- StatusLine
  'saadparwaiz1/cmp_luasnip', -- LuaSnip
  'nvim-lua/plenary.nvim', -- Common Utilities
  'rafamadriz/friendly-snippets', -- Friendly Snippets
  'onsails/lspkind-nvim', -- VSCode-Like Pictograms
  'hrsh7th/cmp-buffer', -- Nvim-Cmp Source for Buffers Words
  'hrsh7th/cmp-nvim-lsp', -- Nvim-Cmp Source for Neovim's built-in LSP
  'hrsh7th/nvim-cmp', -- Completion
  'neovim/nvim-lspconfig', -- LSP
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions and more via Lua
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'glepnir/lspsaga.nvim', -- LSP UIs
  'L3MON4D3/LuaSnip',
  'nvim-tree/nvim-web-devicons', -- File Icons
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
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  }
})
