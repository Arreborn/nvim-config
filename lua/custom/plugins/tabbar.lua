return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {},
  keys = {
    { '<leader><TAB>', '<cmd>BufferNext<cr>', desc = 'Next tab' },
    { '<leader><S-TAB>', '<cmd>BufferPrevious<cr>', desc = 'Previous tab' },
    { '<leader>bq', '<cmd>BufferClose<cr>', desc = 'Close buffer' },
    { '<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr>', desc = 'Close all but current' },
    { '<leader>b1', '<cmd>BufferGoto 1<cr>', silent = true },
    { '<leader>b2', '<cmd>BufferGoto 2<cr>', silent = true },
    { '<leader>b3', '<cmd>BufferGoto 3<cr>', silent = true },
    { '<leader>b4', '<cmd>BufferGoto 4<cr>', silent = true },
    { '<leader>b5', '<cmd>BufferGoto 5<cr>', silent = true },
    { '<leader>b6', '<cmd>BufferGoto 6<cr>', silent = true },
    { '<leader>b7', '<cmd>BufferGoto 7<cr>', silent = true },
    { '<leader>b8', '<cmd>BufferGoto 8<cr>', silent = true },
    { '<leader>b9', '<cmd>BufferGoto 9<cr>', silent = true },
    { '<leader>b0', '<cmd>BufferLast<cr>', desc = 'Last buffer' },
  },
  -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
