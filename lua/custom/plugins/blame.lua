return {
  'tveskag/nvim-blame-line',
  lazy = true,
  event = 'VeryLazy',
  keys = {
    { '<leader>gB', '<cmd>ToggleBlameLine<cr>', desc = 'Toggle [G]it [B]lame Line' },
  },
}
