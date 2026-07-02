vim.pack.add({
  {
    src = 'https://github.com/navarasu/onedark.nvim',
    name = 'onedark.nvim',
  },
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  },
})

require('onedark').setup {
  highlights = {
    ['@visual'] = { fg = '#444444' },
    ['@normalfloat'] = {
      bg = '#21252B',
      fg = '#646568',
    },
  },
  colors = {
    bg0 = '#21252B',
    bg1 = '#21252B',
    bg2 = '#21252B',
  },
  style = 'warm',
}

vim.cmd 'colorscheme onedark'
vim.cmd 'hi WinBar guibg=1E1F20'
vim.cmd 'hi WinBarNC guibg=1E1F20'

vim.api.nvim_set_hl(0, '@spell', { link = '@comment' })
vim.api.nvim_set_hl(0, '@nospell', { link = '@comment' })
vim.api.nvim_set_hl(0, '@spell.markdown', { link = 'NONE' })
vim.api.nvim_set_hl(0, '@spell.markdown_inline', { link = 'NONE' })
vim.api.nvim_set_hl(0, '@nospell.markdown', { link = 'NONE' })
vim.api.nvim_set_hl(0, '@nospell.markdown_inline', { link = 'NONE' })
