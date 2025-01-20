-- Buffer positioning
vim.keymap.set({ 'n', 'v' }, '<F4>', 'zz')
vim.keymap.set('i', '<F4>', '<C-o>zz')
vim.keymap.set('n', '§', '20jzz')
vim.keymap.set('n', '¶', '20kzz')

-- jumping
vim.keymap.set({ 'n', 'v' }, '<F1>', '^')
vim.keymap.set({ 'n', 'v' }, '<F2>', '%')
vim.keymap.set({ 'n', 'v' }, '<F3>', '$')

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

-- let's start cheating
vim.keymap.set({ 'n', 'v', 'i' }, '<F7>', '<cmd>Copilot enable<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<F8>', '<cmd>Copilot disable<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<F9>', '<cmd>Copilot status<cr>')

--  See `:help wincmd` for a list of all window commands
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
vim.keymap.set('n', '<leader>S', '<cmd>w<cr>', { desc = 'Save' })

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

-- Error in Telescope
vim.keymap.set('n', '<leader>se', '<cmd>Telescope notify<cr>', { desc = '[S]earch [E]rror history' })

-- tabby tabby
vim.keymap.set('v', '<TAB>', '>', { silent = true })
vim.keymap.set('v', '<S-Tab>', '<', { silent = true })
vim.keymap.set('n', '<leader><TAB>', '<cmd>BufferNext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader><S-TAB>', '<cmd>BufferPrevious<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>bq', '<cmd>BufferClose<cr>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr>', { desc = 'Close all but current' })
-- for i = 1, 9 do
--   vim.keymap.set('n', '<leader>b' .. i, '<cmd>BufferGoto ' .. i .. '<cr>', { silent = true, desc = 'Go to buffer ' .. i })
-- end
vim.keymap.set('n', '<leader>bs', '<cmd>BufferPick<cr>', { desc = 'Select buffer' })
vim.keymap.set('n', '<leader>b0', '<cmd>BufferLast<cr>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPin<cr>', { desc = 'Pin buffer' })

vim.keymap.set('n', '<leader>G', '<cmd>Neogit<cr>', { desc = 'Neogit' })

vim.keymap.set('n', '<leader>ce', '<cmd>Trouble diagnostics<cr>', { desc = '[C]ode [E]rrors' })

local function toggle_colorcolumn()
  if vim.inspect(vim.opt.cc:get()) == '{}' then
    vim.opt.cc = { 81 }
  else
    vim.opt.cc = {}
  end
end

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', function()
  toggle_colorcolumn()
end, { desc = 'Toggle colorcolumn', silent = true })

vim.keymap.set('n', '<leader>sC', function()
  require('telescope').extensions.diff.diff_files { hidden = true }
end, { desc = '[S]earch and [C]ompare two files' })
vim.keymap.set('n', '<leader>sc', function()
  require('telescope').extensions.diff.diff_current { hidden = true }
end, { desc = '[S]earch and [c]ompare with current' })
