vim.pack.add({
  { src = 'https://github.com/lewis6991/gitsigns.nvim', name = 'gitsigns.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary.nvim' },
  { src = 'https://github.com/sindrets/diffview.nvim', name = 'diffview.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit', name = 'neogit' },
  { src = 'https://github.com/tveskag/nvim-blame-line', name = 'nvim-blame-line' },
})

require('gitsigns').setup {
  signs = {
    add = { text = '' },
    change = { text = '󰘙' },
    delete = { text = '󱖟' },
    topdelete = { text = '󱉇' },
    changedelete = { text = '󱟃' },
  },
}

local map = vim.keymap.set
map('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Git Status' })
map('n', '<leader>gc', '<cmd>Neogit commit<cr>', { desc = 'Git Commit' })
map('n', '<leader>gp', '<cmd>Neogit Push<cr>', { desc = 'Git Push' })
map('n', '<leader>gB', '<cmd>ToggleBlameLine<cr>', { desc = 'Toggle [G]it [B]lame Line' })
