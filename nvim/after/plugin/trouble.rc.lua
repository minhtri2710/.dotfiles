local status, trouble = pcall(require, 'trouble')
if (not status) then return end

vim.keymap.set("n", "<leader>tq", function() trouble.open('quickfix') end, { silent = true, noremap = true })
