vim.pack.add({
  { src = 'https://github.com/folke/noice.nvim', name = 'noice.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim', name = 'nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons', name = 'nvim-web-devicons' },
  { src = 'https://github.com/romgrk/barbar.nvim', name = 'barbar.nvim' },
  { src = 'https://github.com/sschleemilch/slimline.nvim', name = 'slimline.nvim' },
  { src = 'https://github.com/Bekaboo/dropbar.nvim', name = 'dropbar.nvim' },
  { src = 'https://github.com/mawkler/modicator.nvim', name = 'modicator.nvim' },
  { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim', name = 'tiny-inline-diagnostic.nvim' },
})

require('noice').setup {
  views = {
    cmdline_popup = {
      position = { row = 5, col = '50%' },
      size = { width = 60, height = 'auto' },
    },
    popupmenu = {
      relative = 'editor',
      position = { row = 8, col = '50%' },
      size = { width = 60, height = 10 },
      border = {
        style = 'rounded',
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
      },
      notify = { enabled = true },
    },
  },
  presets = {
    lsp_doc_border = true,
  },
}

-- barbar
local map = vim.keymap.set
map('n', '<leader><TAB>', '<cmd>BufferNext<cr>', { desc = 'Next tab' })
map('n', '<leader><S-TAB>', '<cmd>BufferPrevious<cr>', { desc = 'Previous tab' })
map('n', '<leader>bq', '<cmd>BufferClose<cr>', { desc = 'Close buffer' })
map('n', '<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr>', { desc = 'Close all but current' })
map('n', '<leader>bs', '<cmd>BufferPick<cr>', { desc = 'Select buffer' })
map('n', '<leader>bp', '<cmd>BufferPick<cr>', { desc = 'Pin buffer' })
map('n', '<leader>bd', '<cmd>BufferPickDelete<cr>', { desc = 'Pick and delete' })
map('n', '<leader>br', '<cmd>BufferOrderByName<cr>', { desc = 'Sort buffers' })

require('slimline').setup {
  style = 'fg',
  bold = true,
  configs = {
    path = { hl = { primary = 'Label' } },
    git = { hl = { primary = 'Function' } },
    filetype_lsp = { hl = { primary = 'String' } },
  },
}

require('modicator').setup {
  show_warnings = true,
  highlights = {
    defaults = { bold = true },
  },
}

require('tiny-inline-diagnostic').setup {
  hi = { background = '#1E1F20' },
}
vim.diagnostic.config { virtual_text = false }
