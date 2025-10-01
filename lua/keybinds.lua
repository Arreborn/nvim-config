-- Buffer positioning
local map = vim.keymap.set

map('n', '§', '20jzz')
map('n', '¶', '20kzz')

map({ 'n', 'i' }, '<S-Down>', '20jzz')
map({ 'n', 'i' }, '<S-Up>', '20kzz')

map({ 'n', 'v' }, '<S-H>', '^')
map({ 'n', 'v' }, '<S-L>', '$')

map({ 'n', 'v' }, '<C-Left>', '^')
map({ 'n', 'v' }, '<C-Right>', '$')

map({ 'n', 'v' }, '<S-Left>', 'b')
map({ 'n', 'v' }, '<S-Right>', 'w')

map('i', '<S-Left>', '<C-o>^')
map('i', '<S-Right>', '<C-o>$')

map('i', '<S-Left>', '<C-o>b')
map('i', '<S-Right>', '<C-o>w')

map('i', '<M-BS>', '<C-w>', { silent = true })

-- split fixes
map({ 'n', 'v' }, '<Home>', '^', { noremap = true, silent = true })
map({ 'n', 'v' }, '<PageUp>', '30kzz', { noremap = true, silent = true })
map({ 'n', 'v' }, '<PageDown>', '30jzz', { noremap = true, silent = true })
map({ 'n', 'v' }, '<End>', '$', { noremap = true, silent = true })
map({ 'n', 'v' }, '<F2>', '%', { noremap = true, silent = true })

map('i', '<Home>', '<C-o>^', { noremap = true, silent = true })
map('i', '<PageUp>', '<C-o>30k<C-o>zz', { noremap = true, silent = true })
map('i', '<PageDown>', '<C-o>30j<C-o>zz', { noremap = true, silent = true })
map('i', '<End>', '<C-o>$', { noremap = true, silent = true })
map('i', '<F2>', '<C-o>%', { noremap = true, silent = true })

-- Nadim Special
map('i', '<C-v>', '<C-o>p')

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('t', '<Esc>', '<CMD>q<CR>', { desc = 'Exit terminal mode' })
map('t', '<F1>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

map('n', '<D-n>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<D-a>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<D-e>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<C-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Saving keymaps
map('n', '<leader>qw', '<cmd>wq<cr>', { desc = 'Save and quit' })
map('n', '<leader>qa', '<cmd>qa!<cr>', { desc = 'Force quit' })
map('n', '<leader>qq', '<cmd>q<cr>', { desc = 'Quit buffer' })
-- Buffer swap
map({ 'n', 'v' }, '<leader>tn', '<C-w><C-h>', { desc = 'Left buffer' })
map({ 'n', 'v' }, '<leader>ta', '<C-w><C-k>', { desc = 'Up one buffer' })
map({ 'n', 'v' }, '<leader>te', '<C-w><C-j>', { desc = 'Down one buffer' })
map({ 'n', 'v' }, '<leader>ti', '<C-w><C-l>', { desc = 'Right buffer' })

-- Splits
map('n', '<leader>tv', '<cmd>vsplit<cr>', { desc = 'Split buffer vertically' })
map('n', '<leader>ty', '<cmd>split<cr>', { desc = 'Split buffer horizontally' })

-- Bad habits die hard
map({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<cr>')
map({ 'n', 'v', 'i' }, '<D-s>', '<cmd>w<cr>')

-- tabby tabby
map('v', '<TAB>', '>gv', { silent = true })
map('v', '<S-Tab>', '<gv', { silent = true })

map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = '[C]ode [A]ction' })
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = '[R]ename symbol' })

-- map('n', '?', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Show docs' })
map('n', '?', function()
  if vim.api.nvim_get_mode().mode == 'i' then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  end
  vim.lsp.buf.hover()
end, { desc = 'LSP hover' })
