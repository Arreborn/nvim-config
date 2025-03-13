return {
  {
    'Bekaboo/dropbar.nvim',
    config = function()
      local dropbar_api = require 'dropbar.api'
      vim.keymap.set('n', '<leader>cj', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },
}
