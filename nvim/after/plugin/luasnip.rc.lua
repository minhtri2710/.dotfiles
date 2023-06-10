local status, luasnip = pcall(require, 'luasnip')
if (not status) then return end

luasnip.filetype_extend("javascriptreact", {"javascript"})
luasnip.filetype_extend("typescriptreact", {"typescript"})

