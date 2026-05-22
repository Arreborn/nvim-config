vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    name = 'nvim-treesitter',
    version = 'main',
  },
})

vim.schedule(function()
  local ok, configs = pcall(require, 'nvim-treesitter.configs')
  if not ok then return end
  configs.setup {
    ensure_installed = {
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
      'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'puppet',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  }
end)
