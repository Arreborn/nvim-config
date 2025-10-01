return {
  'mawkler/modicator.nvim',
  lazy = true,
  event = 'BufEnter',
  dependencies = 'navarasu/onedark.nvim',
  init = function()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    show_warnings = true,
    highlights = {
      defaults = {
        bold = true,
      },
    },
  },
}
