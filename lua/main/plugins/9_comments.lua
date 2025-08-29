return {
  'folke/todo-comments.nvim',
  event = 'InsertEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    keywords = {
      RESUBMIT = {
        icon = '',
        color = 'error',
        alt = { 'Komplettering' },
      },
      COMMENT = {
        icon = '',
        color = 'warning',
        alt = { 'Kommentar' },
      },
      TIP = {
        icon = '',
        color = 'blue',
        alt = { 'Tips', 'Kommentar / Tips' },
      },
    },
    highlight = {
      keyword = 'fg',
    },
    colors = {
      blue = { 'SnacksPickerIconField', '#5FAFB9' },
    },
    signs = false,
  },
}
