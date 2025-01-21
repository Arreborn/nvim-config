vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt_local.colorcolumn = '80'
vim.opt_local.colorcolumn = '0'
vim.diagnostic.config { virtual_text = false }
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.o.incsearch = false
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = ' ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
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

-- Buffer positioning
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

-- Error in Telescope
vim.keymap.set('n', '<leader>se', '<cmd>Telescope notify<cr>', { desc = '[S]earch [E]rror history' })

-- tabby tabby
vim.keymap.set('v', '<TAB>', '>', { silent = true })
vim.keymap.set('v', '<S-Tab>', '<', { silent = true })
vim.keymap.set('n', '<leader><TAB>', '<cmd>BufferNext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader><S-TAB>', '<cmd>BufferPrevious<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>bq', '<cmd>BufferClose<cr>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr>', { desc = 'Close all but current' })
vim.keymap.set('n', '<leader>bs', '<cmd>BufferPick<cr>', { desc = 'Select buffer' })
vim.keymap.set('n', '<leader>b0', '<cmd>BufferLast<cr>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPin<cr>', { desc = 'Pin buffer' })

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Open Neo[G]it' })
vim.keymap.set('n', '<leader>gb', '<cmd>ToggleBlameLine<cr>', { desc = 'Toggle [G]it [B]lame Line' })

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

local fg = { 'DiagnosticInfo', 'TelescopeBorder', 'TelescopePromptBorder', 'TelescopeResultsBorder', 'TelescopePreviewBorder', 'WhichKeyBorder' }

for _, item in ipairs(fg) do
  vim.api.nvim_set_hl(0, item, { fg = '#e6e6e6' })
end

local bg = {
  'LazyNormal',
  'ScissorsBackdrop',
  'DiagnosticVirtualTextHint',
  'WhichKeyNormal',
  'TroubleNormal',
  'TroubleNormalNC',
  'BufferTabpageFill',
  'BufferDefaultCurrent',
  'BufferDefaultCurrentChanged',
  'NeoTreeEndOfBuffer',
  'NeoTreeNormalNC',
  'NeoTreeNormal',
  'BufferInactive',
  'BufferDefaultTabpagesSep',
  'BufferDefaultInactiveSign',
}

for _, item in ipairs(bg) do
  vim.api.nvim_set_hl(0, item, { bg = '#15191f' })
end

local bg_fg = { 'FloatBorder', 'NeoTreeVertSplit', 'NeoTreeWinSeparator' }

for _, item in ipairs(bg_fg) do
  vim.api.nvim_set_hl(0, item, { bg = '#15191f', fg = '#e6e6e6' })
end

vim.api.nvim_set_hl(0, 'Visual', { bg = '#444444' })

vim.g.rust_recommended_style = false

vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

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
