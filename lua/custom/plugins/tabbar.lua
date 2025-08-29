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
    { '<leader>tq', '<cmd>BufferClose<cr>', desc = 'Close buffer' },
    { '<leader>tQ', '<cmd>BufferCloseAllButCurrent<cr>', desc = 'Close all but current' },
    { '<leader>ts', '<cmd>BufferPick<cr>', desc = 'SelectBuffer' },
    { '<leader>tp', '<cmd>BufferPick<cr>', desc = 'Pin buffer' },
    { '<leader>td', '<cmd>BufferPickDelete<cr>', desc = 'Pick and delete' },
    { '<leader>tr', '<cmd>BufferOrderByName<cr>', desc = 'Sort buffers' },
  },
}
