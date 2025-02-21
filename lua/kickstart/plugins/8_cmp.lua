return {
  'saghen/blink.cmp',
  dependencies = {
    'fang2hou/blink-copilot',
    opts = {
      max_completions = 1, -- Global default for max completions
      max_attempts = 2, -- Global default for max attempts
      -- `kind` is not set, so the default value is "Copilot"
    },
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
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<D-§>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<D-ESC>'] = { 'hide' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
          opts = {
            -- Local options override global ones
            -- Final settings: max_completions = 3, max_attempts = 2, kind = "Copilot"
            max_completions = 3, -- Override global max_completions
          },
        },
      },
    },
    cmdline = {
      enabled = false,
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        border = 'rounded',
        draw = {
          -- treesitter = { 'lsp' },
          columns = {
            { 'kind_icon', gap = 1 },
            { 'label', 'label_description', gap = 1 },
            { 'kind', gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = 'rounded',
        },
      },
    },
    signature = { window = { border = 'rounded' } },
  },
  opts_extend = { 'sources.default' },
}
