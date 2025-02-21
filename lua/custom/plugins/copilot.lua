return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'InsertEnter',
  keys = {
    { '<F7>', '<cmd>Copilot enable<cr>', mode = { 'n', 'v', 'i' } },
    { '<F8>', '<cmd>Copilot disable<cr>', mode = { 'n', 'v', 'i' } },
    { '<F9>', '<cmd>Copilot status<cr>', mode = { 'n', 'v', 'i' } },
  },
  opts = {
    suggestion = { enabled = true, auto_trigger = false, keymap = { accept = '§', next = '<S-§>' } },
    panel = { enabled = false },
  },
}
