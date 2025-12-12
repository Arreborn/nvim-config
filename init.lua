vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

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

vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

require('lazy').setup({
  { import = 'priority.plugins' },
  { import = 'main.plugins' },
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

require 'keybinds'
if vim.g.neovide then
  require 'neovide'
end

vim.g.rust_recommended_style = false

vim.cmd 'colorscheme onedark'
vim.cmd 'hi WinBar guibg=1E1F20'
vim.cmd 'hi WinBarNC guibg=1E1F20'

vim.api.nvim_set_hl(0, '@spell', { link = '@comment' })
vim.api.nvim_set_hl(0, '@nospell', { link = '@comment' })
vim.api.nvim_set_hl(0, '@spell.markdown', { link = 'NONE' })
vim.api.nvim_set_hl(0, '@spell.markdown_inline', { link = 'NONE' })
vim.api.nvim_set_hl(0, '@nospell.markdown', { link = 'NONE' })
vim.api.nvim_set_hl(0, '@nospell.markdown_inline', { link = 'NONE' })
