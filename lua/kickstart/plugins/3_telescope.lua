return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    -- 'nvim-lua/plenary.nvim',
    -- {
    --   'nvim-telescope/telescope-fzf-native.nvim',
    --   build = 'make',
    --   cond = function()
    --     return vim.fn.executable 'make' == 1
    --   end,
    -- },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'

    require('telescope').setup {
      defaults = {
        layout_strategy = 'horizontal',
        mappings = {
          i = { ['<esc>'] = actions.close },
        },
      },
      layout_config = {
        horizontal = {
          prompt_position = 'top',
        },
      },
      sorting_strategy = 'ascending',
      borderchars = {
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
    }
  end,
}
