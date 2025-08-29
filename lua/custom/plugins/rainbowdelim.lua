return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'LspAttach',
  config = function()
    vim.g.rainbow_delimiters = {
      highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterRed',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
