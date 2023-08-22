local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
  ensure_installed = {
    'lua-language-server',
    'html-lsp',
    'prettier',
    'stylua'
  }
})

lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'eslint',
    'html',
    'cssls',
    'clangd'
  }
})
