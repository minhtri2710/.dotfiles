local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#24283b',
      bg = '#574d79',
    },
    separator_selected = {
      fg = '#24283b',
      bg = '#7c6eac',
    },
    background = {
      fg = '#657b83',
      bg = '#574d79'
    },
    buffer_selected = {
      bg = '#7c6eac',
      bold = true,
    },
    fill = {
      fg = '#7c6eac',
    },
    modified = {
      bg = '#574d79',
    },
    modified_selected = {
      bg = '#7c6eac',
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
