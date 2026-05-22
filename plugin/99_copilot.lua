vim.pack.add({
  { src = 'https://github.com/zbirenbaum/copilot.lua', name = 'copilot.lua' },
})

require('copilot').setup {
  auth_provider_url = 'https://linkpings-universitet.ghe.com',
}
