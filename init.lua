-- bye bye, netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line length?
vim.opt_local.colorcolumn = '80'
vim.opt_local.colorcolumn = '0'

-- maybe tiny diagnostic work better now?
vim.diagnostic.config { virtual_text = false }

-- give me neat tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- for vgit
vim.o.incsearch = false

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 50

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = ' ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      dashboard = { enabled = true },
      indent = { enabled = true },
      statuscolumn = { enabled = true },
    },
  },
  { import = 'kickstart.plugins' },
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
    border = 'rounded',
    colorscheme = 'onedark',
  },
})

-- require 'lua/custom/keybinds/init'
-- require 'lua/custom/colors/init'

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

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd 'Copilot disable'
  end,
})

vim.cmd 'colorscheme onedark'

-- Highlights
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = '#e6e6e6' })

vim.api.nvim_set_hl(0, 'LazyNormal', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'ScissorsBackdrop', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#15191f', fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'WhichKeyNormal', { fg = '#15191f' })
vim.api.nvim_set_hl(0, 'WhichKeyBorder', { fg = '#e6e6e6' })

vim.api.nvim_set_hl(0, 'TroubleNormal', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'TroubleNormalNC', { bg = '#15191f' })

vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'BufferDefaultCurrent', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'BufferDefaultCurrentChanged', { bg = '#15191f' })

vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'NeoTreeVertSplit', { bg = '#15191f', fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { bg = '#15191f', fg = '#e6e6e6' })
vim.api.nvim_set_hl(0, 'BufferInactive', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'BufferDefaultTabpagesSep', { bg = '#15191f' })
vim.api.nvim_set_hl(0, 'BufferDefaultInactiveSign', { bg = '#15191f' })

vim.api.nvim_set_hl(0, 'Visual', { bg = '#444444' })

-- respect me, rust
vim.g.rust_recommended_style = false

-- neovide settings
if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_normal_opacity = 0.9
  vim.g.neovide_window_blurred = true
  vim.g.transparency = 0.8
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_floating_corner_radius = 1
  vim.cmd 'set winblend=80'
  vim.o.guifont = 'JetBrainsMono Nerd Font Propo:h13'
  local default_path = vim.fn.expand '~'
  vim.api.nvim_set_current_dir(default_path)
end
