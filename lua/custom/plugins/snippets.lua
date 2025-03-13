return {
  'chrisgrieser/nvim-scissors',
  opts = {
    snippetDir = '~/.config/nvim/snippets/',
  },
  snacks = {
    alsoSearchSnippetBody = false,
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
