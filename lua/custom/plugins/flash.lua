return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opt = {},
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = {
            mode = function(str)
              return '\\<' .. str
            end,
          },
        }
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
    {
      'R',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
    },
  },
  config = function()
    vim.api.nvim_set_hl(0, 'FlashCurrent', { bold = false, fg = '#FFFFFF' })
    vim.api.nvim_set_hl(0, 'FlashMatch', { bold = false, fg = '#FFFFFF' })
    vim.api.nvim_set_hl(0, 'FlashLabel', { bold = true, fg = '#FF0000', bg = '#404247' })
    vim.api.nvim_set_hl(0, 'FlashBackdrop', { italic = false, fg = '#646568' })
  end,
}
