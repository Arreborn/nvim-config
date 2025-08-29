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
          local buf = vim.api.nvim_get_current_buf()
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(buf) then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end)

          vim.cmd 'enew'
          vim.bo.bufhidden = 'wipe'
          vim.bo.buftype = 'nofile'
          vim.bo.swapfile = false

          vim.cmd 'lua Snacks.picker.explorer({ auto_close = true, follow_file = false, })'
          vim.api.nvim_clear_autocmds { group = 'ExplorerInit' }
        end
      end,
    })
  end,

  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    indent = { enabled = true, only_scope = true },
    statuscolumn = { enabled = true },
    input = { enabled = true },
    terminal = { enabled = true },
    scratch = { enabled = true },
    image = { enabled = true },
    picker = {
      enabled = true,
      win = {
        list = {
          keys = {
            ['<F4>'] = { 'toggle_preview', mode = { 'i', 'n' } },
            ['<F5>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
            ['<F6>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          },
        },
      },
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        Snacks.explorer { auto_close = true, follow_file = false }
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Search with grep',
    },
    {
      '<leader>pp',
      function()
        Snacks.picker()
      end,
      desc = '[P]icker [P]icker',
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branch()
      end,
      desc = '[G]it [B]ranch',
    },
    {
      '<leader>pc',
      function()
        Snacks.picker.command_history()
      end,
      desc = '[P]ick [C]ommand from history',
    },
    {
      '<leader>pb',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[P]ick [B]uffer',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep in open buffers',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>se',
      function()
        Snacks.picker.noice()
      end,
      desc = '[S]earch [E]rror history',
    },
    {
      '<leader>gp',
      function()
        Snacks.picker.projects()
      end,
      desc = '[G]it [P]rojects',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_files()
      end,
      desc = '[G]it [F]iles',
    },
    {
      '<leader>n',
      function()
        Snacks.scratch()
      end,
      desc = '[N]ote',
    },
    {
      '<leader>pn',
      function()
        Snacks.scratch.select()
      end,
      desc = '[P]ick [N]ote',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.recent()
      end,
      desc = '[S]earch [R]ecent files',
    },
    {
      '<leader>ws',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = '[W]orkspace [S]ymbols',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = '[G]oto [D]efinition',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = '[G]oto [R]eferences',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = '[G]oto [I]mplementation',
    },
    {
      '<leader>D',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Type [D]efinition',
    },
    {
      '<leader>ds',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = '[D]ocument [S]ymbols',
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gL',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Git Log Line',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Git Status',
    },
    {
      '<leader>gS',
      function()
        Snacks.picker.git_stash()
      end,
      desc = 'Git Stash',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diff (Hunks)',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log File',
    },
    {
      '<leader>sl',
      function()
        Snacks.picker.lines()
      end,
      desc = '[S]earch [L]ines',
    },
  },
}
