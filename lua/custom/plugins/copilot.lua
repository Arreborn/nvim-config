return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'InsertEnter',
  opts = {
    suggestion = { enabled = true, auto_trigger = true, keymap = { accept = '<Tab>', next = '<S-Tab>' } },
    panel = { enabled = false },
    -- filetypes = {
    --   ['*'] = false,
    -- },
  },
}
