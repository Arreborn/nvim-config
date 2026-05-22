vim.pack.add({
  { src = 'https://github.com/folke/snacks.nvim', name = 'snacks.nvim' },
})

---@type snacks.Config
require('snacks').setup {
  dashboard = {
    enabled = true,
    sections = {
      { section = 'header' },
      { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
      { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
      { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },

    },
  },
  indent = { enabled = true, only_scope = true },
  statuscolumn = { enabled = true },
  input = { enabled = true },
  terminal = { enabled = true },
  scratch = { enabled = true },
  image = { enabled = true },
  notifier = { enabled = true },
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
}

-- Open explorer when nvim is opened on a directory
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

local map = vim.keymap.set

map('n', '<leader>e', function() Snacks.explorer { auto_close = true, follow_file = false } end, { desc = 'File Explorer' })
map('n', '<leader>/', function() Snacks.picker.grep_buffers() end, { desc = 'Search with grep' })
map('n', '<leader>pp', function() Snacks.picker() end, { desc = '[P]icker [P]icker' })
map('n', '<leader>pc', function() Snacks.picker.command_history() end, { desc = '[P]ick [C]ommand from history' })
map('n', '<leader>pb', function() Snacks.picker.buffers() end, { desc = '[P]ick [B]uffer' })
map('n', '<leader><leader>', function() Snacks.picker.grep_buffers() end, { desc = 'Grep in open buffers' })
map('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sh', function() Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
map('n', '<leader>sf', function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
map('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = '[S]earch by [G]rep' })
map('n', 'Q', function() Snacks.picker.grep() end, { desc = '[Q]uery' })
map('n', '<leader>se', function() Snacks.picker.noice() end, { desc = '[S]earch [E]rror history' })
map('n', '<leader>gp', function() Snacks.picker.projects() end, { desc = '[G]it [P]rojects' })
map('n', '<leader>gf', function() Snacks.picker.git_log_file() end, { desc = 'Git Log File' })
map('n', '<leader>n', function() Snacks.scratch() end, { desc = '[N]ote' })
map('n', '<leader>pn', function() Snacks.scratch.select() end, { desc = '[P]ick [N]ote' })
map('n', '<leader>sr', function() Snacks.picker.recent() end, { desc = '[S]earch [R]ecent files' })
map('n', '<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, { desc = '[W]orkspace [S]ymbols' })
map('n', 'gd', function() Snacks.picker.lsp_definitions() end, { desc = '[G]oto [D]efinition' })
map('n', 'gr', function() Snacks.picker.lsp_references() end, { desc = '[G]oto [R]eferences' })
map('n', 'gI', function() Snacks.picker.lsp_implementations() end, { desc = '[G]oto [I]mplementation' })
map('n', '<leader>D', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Type [D]efinition' })
map('n', '<leader>ds', function() Snacks.picker.lsp_symbols() end, { desc = '[D]ocument [S]ymbols' })
map('n', '<leader>gb', function() Snacks.picker.git_branches() end, { desc = 'Git Branches' })
map('n', '<leader>gl', function() Snacks.picker.git_log() end, { desc = 'Git Log' })
map('n', '<leader>gL', function() Snacks.picker.git_log_line() end, { desc = 'Git Log Line' })
map('n', '<leader>gs', function() Snacks.picker.git_status() end, { desc = 'Git Status' })
map('n', '<leader>gS', function() Snacks.picker.git_stash() end, { desc = 'Git Stash' })
map('n', '<leader>gd', function() Snacks.picker.git_diff() end, { desc = 'Git Diff (Hunks)' })
map('n', '<leader>sl', function() Snacks.picker.lines() end, { desc = '[S]earch [L]ines' })
map('n', '<leader>j', function() Snacks.picker.jumps() end, { desc = '[J]umps' })
map('n', '<leader>ll', function() Snacks.picker.qflist() end, { desc = 'Quickfix [L]ist' })
