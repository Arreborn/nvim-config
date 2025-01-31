local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('ExplorerInit', { clear = true }),
      callback = function()
        local f = vim.fn.expand '%:p'
        if vim.fn.isdirectory(f) ~= 0 then
          vim.cmd('cd' .. f)
          vim.cmd 'lua Snacks.picker.explorer({ auto_close = true, follow_file = false })'
          vim.api.nvim_clear_autocmds { group = 'ExplorerInit' }
        else
          local dir = vim.fn.fnamemodify(f, ':h')
          vim.cmd('cd' .. dir)
        end
      end,
    })
  end,
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = true },
    indent = { enabled = true },
    statuscolumn = { enabled = true },
    picker = {
      enabled = true,
    },
  },
  keys = {
    map('n', '<leader>e', '<cmd>lua Snacks.picker.explorer({ auto_close = true, follow_file = false })<cr>', { desc = 'Open file explorer' }),
  },
}
