return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'BufEnter',
  config = function()
    require('tiny-inline-diagnostic').setup {
      hi = {
        background = '#1E1F20',
      },
    }
    vim.diagnostic.config { virtual_text = false }
  end,
}
