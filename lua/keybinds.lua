-- Buffer positioning
vim.keymap.set('n', '§', '20jzz')
vim.keymap.set('n', '¶', '20kzz')

-- Jumping
vim.keymap.set({ 'n', 'v' }, 'ö', '^')
vim.keymap.set({ 'n', 'v' }, 'å', '%')
vim.keymap.set({ 'n', 'v' }, 'ä', '$')

-- jumping in insert mode
vim.keymap.set('i', '<F1>', '<C-o>^')
vim.keymap.set('i', '<F2>', '<C-o>%')
vim.keymap.set('i', '<F3>', '<C-o>$')

-- insert mode specials
vim.keymap.set('i', '<A-w>', '<C-o>w')
vim.keymap.set('i', '<A-e>', '<C-o>e')
vim.keymap.set('i', '<A-b>', '<C-o>b')
vim.keymap.set('i', '<A-d>', '<C-o>dw')
vim.keymap.set('i', '<A-u>', '<C-o>u')
vim.keymap.set('i', '<A-BS>', '<C-o>b<C-o>dw')

-- Nadim Special
vim.keymap.set('i', '<C-v>', '<C-o>p')

-- Pls reverse tab
vim.keymap.set('i', '<S-tab>', '<C-d>')

vim.keymap.set('n', '<leader>bh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>bl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>bj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>bk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc>', '<CMD>q<CR>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Saving keymaps
vim.keymap.set('n', '<leader>qw', '<cmd>wq<cr>', { desc = 'Save and quit' })
vim.keymap.set('n', '<leader>qa', '<cmd>qa!<cr>', { desc = 'Force quit' })
vim.keymap.set('n', '<leader>qq', '<cmd>q<cr>', { desc = 'Quit buffer' })

-- Buffer swap
vim.keymap.set({ 'n', 'v' }, '<leader>bh', '<C-w><C-h>', { desc = 'Left buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bl', '<C-w><C-l>', { desc = 'Right buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bk', '<C-w><C-k>', { desc = 'Up one buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>bj', '<C-w><C-j>', { desc = 'Down one buffer' })

-- Splits
vim.keymap.set('n', '<leader>bv', '<cmd>vsplit<cr>', { desc = 'Split buffer vertically' })
vim.keymap.set('n', '<leader>bg', '<cmd>split<cr>', { desc = 'Split buffer horizontally' })

-- Bad habits die hard
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<D-s>', '<cmd>w<cr>')

-- tabby tabby
vim.keymap.set('v', '<TAB>', '>', { silent = true })
vim.keymap.set('v', '<S-Tab>', '<', { silent = true })

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd 'Copilot disable'
  end,
})

-- leap
vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

vim.keymap.set({ 'i', 's' }, '<C-l>', function()
  if vim.snippet.active { direction = 1 } then
    return '<cmd>lua vim.snippet.jump(1)<cr>'
  else
    return '<C-l>'
  end
end, { expr = true })

vim.keymap.set({ 'i', 's' }, '<C-h>', function()
  if vim.snippet.active { direction = -1 } then
    return '<cmd>lua vim.snippet.jump(-1)<cr>'
  else
    return '<C-h>'
  end
end, { expr = true })

vim.keymap.set({ 'i', 's' }, '<C-k>', function()
  if vim.snippet.active then
    return '<cmd>lua vim.snippet.stop()<cr>'
  else
    return '<C-k>'
  end
end, { expr = true })

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
  if vim.snippet.active then
    return '<cmd>lua vim.snippet.expand()<cr>'
  else
    return '<C-j>'
  end
end, { expr = true })

local blink = require 'blink.cmp'

vim.keymap.set('i', '<ESC>', function()
  if blink.is_menu_visible() then
    blink.hide()
    return ''
  else
    return '<ESC>'
  end
end, { expr = true })
