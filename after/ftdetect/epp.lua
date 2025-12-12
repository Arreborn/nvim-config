-- Detect "real" filetype for *.epp by stripping the .epp suffix
-- and inferring from base extension / shebang.

local function detect_ft(bufnr)
  local full = vim.api.nvim_buf_get_name(bufnr)
  local filename = vim.fn.fnamemodify(full, ':t')

  if not filename:match '%.epp$' then
    return nil
  end

  local stripped = filename:gsub('%.epp$', '')

  -- 1. Special filenames (no extension)
  local specials = {
    ['Dockerfile'] = 'dockerfile',
    ['Makefile'] = 'make',
  }
  if specials[stripped] then
    return specials[stripped]
  end

  -- 2. Guess from last extension
  local ext = stripped:match '%.([%w_+-]+)$'
  if ext then
    local map = {
      sh = 'sh',
      bash = 'sh',
      zsh = 'sh',
      ksh = 'sh',

      py = 'python',
      rb = 'ruby',
      pl = 'perl',

      yaml = 'yaml',
      yml = 'yaml',

      json = 'json',
      toml = 'toml',
      ini = 'dosini',
      conf = 'conf',
      cfg = 'conf',

      service = 'systemd',
      timer = 'systemd',
    }

    if map[ext] then
      return map[ext]
    end
  end

  -- 3. Fallback: shebang detection
  local first = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''
  local shebang = first:match '^#!%s*(.+)'
  if shebang then
    if shebang:match 'python' then
      return 'python'
    elseif shebang:match 'bash' or shebang:match 'sh' or shebang:match 'zsh' then
      return 'sh'
    elseif shebang:match 'ruby' then
      return 'ruby'
    end
  end

  return nil
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.epp',
  callback = function(ev)
    local ft = detect_ft(ev.buf)
    if ft then
      vim.cmd('setfiletype ' .. ft)
    end
  end,
})
