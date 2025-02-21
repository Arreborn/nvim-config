return {
  'chrisgrieser/nvim-scissors',
  dependencies = 'nvim-telescope/telescope.nvim',
  opts = {
    snippetDir = '~/.config/nvim/snippets/',
  },
  config = function()
    vim.keymap.set('n', '<leader>xe', function()
      require('scissors').editSnippet()
    end, { desc = 'Snippet: Edit' })

    vim.keymap.set({ 'n', 'x' }, '<leader>xa', function()
      require('scissors').addNewSnippet()
    end, { desc = 'Snippet: Add' })
  end,
}
