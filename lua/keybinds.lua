-- Buffer positioning
vim.keymap.set('n', '§', '20jzz')
vim.keymap.set('n', '¶', '20kzz')

vim.keymap.set({ 'n', 'i' }, '<S-Down>', '20jzz')
vim.keymap.set({ 'n', 'i' }, '<S-Up>', '20kzz')

vim.keymap.set({ 'n', 'v' }, '<S-H>', '^')
vim.keymap.set({ 'n', 'v' }, '<S-L>', '$')

vim.keymap.set({ 'n', 'v' }, '<C-Left>', '^')
vim.keymap.set({ 'n', 'v' }, '<C-Right>', '$')

vim.keymap.set({ 'n', 'v' }, '<S-Left>', 'b')
vim.keymap.set({ 'n', 'v' }, '<S-Right>', 'w')

vim.keymap.set('i', '<S-Left>', '<C-o>^')
vim.keymap.set('i', '<S-Right>', '<C-o>$')

vim.keymap.set('i', '<S-Left>', '<C-o>b')
vim.keymap.set('i', '<S-Right>', '<C-o>w')

vim.keymap.set('i', '<M-BS>', '<C-w>', { silent = true })

-- split fixes
vim.keymap.set({ 'n', 'v' }, '<Home>', '^', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<PageUp>', '30kzz', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<PageDown>', '30jzz', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<End>', '$', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<F2>', '%', { noremap = true, silent = true })

vim.keymap.set('i', '<Home>', '<C-o>^', { noremap = true, silent = true })
vim.keymap.set('i', '<PageUp>', '<C-o>30k<C-o>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<PageDown>', '<C-o>30j<C-o>zz', { noremap = true, silent = true })
vim.keymap.set('i', '<End>', '<C-o>$', { noremap = true, silent = true })
vim.keymap.set('i', '<F2>', '<C-o>%', { noremap = true, silent = true })

-- Nadim Special
vim.keymap.set('i', '<C-v>', '<C-o>p')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc>', '<CMD>q<CR>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<F1>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<D-n>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<D-a>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<D-e>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

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
vim.keymap.set({ 'n', 'v' }, '<leader>tn', '<C-w><C-h>', { desc = 'Left buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>ta', '<C-w><C-k>', { desc = 'Up one buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>te', '<C-w><C-j>', { desc = 'Down one buffer' })
vim.keymap.set({ 'n', 'v' }, '<leader>ti', '<C-w><C-l>', { desc = 'Right buffer' })

-- Splits
vim.keymap.set('n', '<leader>tv', '<cmd>vsplit<cr>', { desc = 'Split buffer vertically' })
vim.keymap.set('n', '<leader>ty', '<cmd>split<cr>', { desc = 'Split buffer horizontally' })

-- Bad habits die hard
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<D-s>', '<cmd>w<cr>')

-- tabby tabby
vim.keymap.set('v', '<TAB>', '>gv', { silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { silent = true })

vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = '[C]ode [A]ction' })
