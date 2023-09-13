local status, lsp_zero = pcall(require, 'lsp-zero')
if (not status) then return end

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp_zero.default_keymaps(opts)
  lsp_zero.buffer_autoformat()

  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
})

lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = '',
})

require('mason').setup({})
