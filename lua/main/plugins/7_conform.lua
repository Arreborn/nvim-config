return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        local filepath = vim.api.nvim_buf_get_name(0)
        local filetype = vim.bo.filetype

        if filetype == 'puppet' or filepath:match '%.pp$' then
          vim.fn.system { 'puppet-lint', '--fix', filepath }
          vim.cmd 'edit!'
        else
          require('conform').format { async = true, lsp_format = 'fallback' }
        end
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      markdown = { 'prettier' },
    },
  },
}
