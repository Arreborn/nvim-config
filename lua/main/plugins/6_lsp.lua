return {
  { 'mason-org/mason.nvim', opts = {} },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      lspconfig.puppet.setup {
        cmd = {
          'puppet-languageserver',
          '--stdio',
          '--timeout=0', -- never time out waiting for a client
          '--no-stop', -- don’t exit after client disconnects
        },
        settings = {
          puppet = {
            editorServices = {
              formatOnType = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },

  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
}
