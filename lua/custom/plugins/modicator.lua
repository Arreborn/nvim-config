return {
  'mawkler/modicator.nvim',
  dependencies = 'mawkler/onedark.nvim',
  init = function()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    show_warnings = true,
  },
}
