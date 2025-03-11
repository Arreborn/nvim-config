return {
  'sontungexpt/sttusline',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = { 'BufEnter' },
  config = function(_, opts)
    require('sttusline').setup {
      -- statusline_color = '#15191f',
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
        'copilot',
        'indent',
        'encoding',
        'pos-cursor',
      },
    }
  end,
}
