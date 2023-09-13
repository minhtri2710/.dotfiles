local status, lsp_zero = pcall(require, "lsp-zero")
if (not status) then return end
lsp_zero.extend_lspconfig()
local status2, nvim_lsp = pcall(require, "lspconfig")
if (not status2) then return end

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'rust_analyzer',
    'tailwindcss',
    'cssls',
    'astro',
    'intelephense',
    'denols',
    'eslint',
    'html',
    'psalm',
    'jsonls'
  },
  handlers = {
    lsp_zero.default_setup,
    tsserver = function()
      nvim_lsp.tsserver.setup {
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" }
      }
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },

            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                vim.env.VIMRUNTIME,
                vim.api.nvim_get_runtime_file("", true)
              },
              checkThirdParty = false
            },
          },
        },
      })
      nvim_lsp.lua_ls.setup(lua_opts)
    end,
    emmet_ls = function()
      nvim_lsp.emmet_ls.setup {
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
          "typescriptreact", "vue" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        }
      }
    end,
  }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "\u{ea71}" },
    severity_sort = true,
  }
)

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
