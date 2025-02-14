return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    keywords = {
      RESUBMIT = {
        color = 'error',
        alt = { 'Komplettering' },
      },
      COMMENT = {
        color = 'warning',
        alt = { 'Kommentar', 'Kommentar / Tips' },
      },
    },
    highlight = {
      keyword = 'fg',
    },
    signs = false,
  },
}
