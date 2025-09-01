return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.snippets').setup()
    require('mini.ai').setup()
    require('mini.sessions').setup { directory = vim.fn.stdpath 'config' .. '/session/' }
    require('mini.surround').setup {
      enable = true,
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',
      },
    }
  end,
  keys = {
    { '<leader>!', '<cmd>mksession<cr>', desc = 'Make session' },
  },
}
