return {
  'saghen/blink.cmp',
  dependencies = {
    { 'onsails/lspkind.nvim' },
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = {
      preset = 'enter',
      ['<TAB>'] = { 'select_next', 'fallback' },
      ['<D-§>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<ESC>'] = { 'hide', 'fallback' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
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
        window = {
          border = 'rounded',
        },
      },
    },
    signature = { window = { border = 'rounded' } },
  },
  opts_extend = { 'sources.default' },
}
