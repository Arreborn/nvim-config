return {
  'hinell/move.nvim',
  config = function()
    vim.keymap.set('n', '<leader>mk', '<cmd>MoveLine 1<cr>', { desc = 'Move line up' })
    vim.keymap.set('n', '<leader>mj', '<cmd>MoveLine -1<cr>', { desc = 'Move line down' })

    vim.keymap.set('n', '<leader>mK2', '<cmd>MoveLine 2<cr>', { desc = 'Move line up 2' })
    vim.keymap.set('n', '<leader>mK3', '<cmd>MoveLine 3<cr>', { desc = 'Move line up 3' })
    vim.keymap.set('n', '<leader>mK4', '<cmd>MoveLine 4<cr>', { desc = 'Move line up 4' })
    vim.keymap.set('n', '<leader>mK5', '<cmd>MoveLine 5<cr>', { desc = 'Move line up 5' })
    vim.keymap.set('n', '<leader>mK6', '<cmd>MoveLine 6<cr>', { desc = 'Move line up 6' })
    vim.keymap.set('n', '<leader>mK7', '<cmd>MoveLine 7<cr>', { desc = 'Move line up 7' })
    vim.keymap.set('n', '<leader>mK8', '<cmd>MoveLine 8<cr>', { desc = 'Move line up 8' })
    vim.keymap.set('n', '<leader>mK9', '<cmd>MoveLine 9<cr>', { desc = 'Move line up 9' })

    vim.keymap.set('n', '<leader>mJ2', '<cmd>MoveLine -2<cr>', { desc = 'Move line down 2' })
    vim.keymap.set('n', '<leader>mJ3', '<cmd>MoveLine -3<cr>', { desc = 'Move line down 3' })
    vim.keymap.set('n', '<leader>mJ4', '<cmd>MoveLine -4<cr>', { desc = 'Move line down 4' })
    vim.keymap.set('n', '<leader>mJ5', '<cmd>MoveLine -5<cr>', { desc = 'Move line down 5' })
    vim.keymap.set('n', '<leader>mJ6', '<cmd>MoveLine -6<cr>', { desc = 'Move line down 6' })
    vim.keymap.set('n', '<leader>mJ7', '<cmd>MoveLine -7<cr>', { desc = 'Move line down 7' })
    vim.keymap.set('n', '<leader>mJ8', '<cmd>MoveLine -8<cr>', { desc = 'Move line down 8' })
    vim.keymap.set('n', '<leader>mJ9', '<cmd>MoveLine -9<cr>', { desc = 'Move line down 9' })
  end,
}
