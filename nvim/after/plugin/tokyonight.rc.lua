local status, tokyonight = pcall(require, 'tokyonight')
if (not status) then return end

tokyonight.setup {}

-- Theme
vim.cmd [[colorscheme tokyonight-storm]]

function ColorMyPencils(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
