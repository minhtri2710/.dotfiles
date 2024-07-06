-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.listchars:append({ space = " " })
  end,
})

-- Disable autoformat
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*.phtml",
  callback = function()
    vim.b.autoformat = false
    vim.opt.wrap = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*.php",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.wrap = true
    vim.opt.expandtab = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*.log",
  callback = function()
    vim.bo.syntax = "ON"
    vim.bo.filetype = "log"
  end,
})
