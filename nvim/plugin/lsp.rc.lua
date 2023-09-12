local status, lsp_zero = pcall(require, 'lsp-zero')
if (not status) then return end

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.setup_servers({})
