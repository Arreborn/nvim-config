return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  keys = {
    { '<leader>dd', '<cmd>lua require("dapui").toggle()<cr>', desc = 'Toggle debug window' },
    { '<leader>de', '<cmd>lua require("dapui").eval()<cr>', desc = 'Evaluate expression' },
  },
}
