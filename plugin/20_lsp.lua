vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim', name = 'mason.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig', name = 'nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim', name = 'mason-lspconfig.nvim' },
  { src = 'https://github.com/folke/lazydev.nvim', name = 'lazydev.nvim' },
  { src = 'https://github.com/Bilal2453/luvit-meta', name = 'luvit-meta' },
})

require('mason').setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

require('mason-lspconfig').setup {}

require('lazydev').setup {
  library = {
    { path = 'luvit-meta/library', words = { 'vim%.uv' } },
  },
}
