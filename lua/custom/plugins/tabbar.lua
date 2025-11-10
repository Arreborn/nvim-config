return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  opt = {
    auto_hide = false,
  },
  keys = {
    { '<leader><TAB>', '<cmd>BufferNext<cr>', desc = 'Next tab' },
    { '<leader><S-TAB>', '<cmd>BufferPrevious<cr>', desc = 'Previous tab' },
    { '<leader>bq', '<cmd>BufferClose<cr>', desc = 'Close buffer' },
    { '<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr>', desc = 'Close all but current' },
    { '<leader>bs', '<cmd>BufferPick<cr>', desc = 'SelectBuffer' },
    { '<leader>bp', '<cmd>BufferPick<cr>', desc = 'Pin buffer' },
    { '<leader>bd', '<cmd>BufferPickDelete<cr>', desc = 'Pick and delete' },
    { '<leader>br', '<cmd>BufferOrderByName<cr>', desc = 'Sort buffers' },
  },
}
