return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>hh',
      '<cmd>Trouble diagnostics toggle focus=false<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>hH',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>hb',
      '<cmd>Trouble symbols toggle focus=false win.size=0. win.size=0.2<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>hj',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>hg',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>hy',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
