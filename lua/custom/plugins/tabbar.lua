return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
    vim.keymap.set('n', '<leader><TAB>', '<cmd>BufferNext<cr>', { desc = 'Next tab' })
    vim.keymap.set('n', '<leader><S-TAB>', '<cmd>BufferPrevious<cr>', { desc = 'Previous tab' })
    vim.keymap.set('n', '<leader>bq', '<cmd>BufferClose<cr>', { desc = 'Close buffer' })
    vim.keymap.set('n', '<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr>', { desc = 'Close all but current' })
    vim.keymap.set('n', '<leader>bs', '<cmd>BufferPick<cr>', { desc = 'Select buffer' })
    vim.keymap.set('n', '<leader>b0', '<cmd>BufferLast<cr>', { desc = 'Last buffer' })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferPin<cr>', { desc = 'Pin buffer' })
  end,
  opts = {
    auto_hide = false,
  },
}
