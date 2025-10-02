return {
  'sontungexpt/sttusline',
  branch = 'table_version',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = { 'BufEnter' },
  config = function(_, opts)
    require('sttusline').setup {
      laststatus = 3,
      disabled = {
        filetypes = {},
        buftypes = {
          'terminal',
        },
      },
      components = {
        'mode',
        'filename',
        'git-branch',
        'git-diff',
        '%=',
        'diagnostics',
        'lsps-formatters',
        'indent',
        'encoding',
        'pos-cursor',
      },
    }
  end,
}
