return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  config = function()
    require('copilot').setup()
  end,
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      help = true,
    },
  },
}
