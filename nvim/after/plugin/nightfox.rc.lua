local status, n = pcall(require, 'nightfox')
if (not status) then return end

n.setup({
  options = {
    transparent = true
  }
})

vim.cmd("colorscheme nightfox")
