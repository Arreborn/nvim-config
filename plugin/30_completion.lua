vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'blink.cmp' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('blink.cmp') end
      require('blink.cmp').build():wait(60000)
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/saghen/blink.lib', name = 'blink.lib' },
  { src = 'https://github.com/saghen/blink.cmp', name = 'blink.cmp' },
  { src = 'https://github.com/onsails/lspkind.nvim', name = 'lspkind.nvim' },
})

require('blink.cmp').build():wait(60000)

---@module 'blink.cmp'
---@type blink.cmp.Config
require('blink.cmp').setup {
  keymap = {
    preset = 'enter',
    ['<TAB>'] = { 'select_next', 'snippet_forward', 'fallback' },
    ['<ESC>'] = { 'hide', 'fallback' },
    ['<S-TAB>'] = { 'snippet_backward', 'fallback' },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      border = 'rounded',
      scrollbar = false,
      draw = {
        columns = {
          { 'kind_icon', gap = 1 },
          { 'label', 'label_description', gap = 1 },
          { 'kind', gap = 1 },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
      window = { border = 'rounded' },
    },
  },
  signature = { window = { border = 'rounded' } },
}
