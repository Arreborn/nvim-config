return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'folke/snacks.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Git Status' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Git Commit' },
    { '<leader>gp', '<cmd>Neogit Push<cr>', desc = 'Git Push' },
  },
}
