vim.cmd 'colorscheme onedark'

local fg = { 'DiagnosticInfo', 'TelescopeBorder', 'TelescopePromptBorder', 'TelescopeResultsBorder', 'TelescopePreviewBorder', 'WhichKeyBorder' }

for _, item in ipairs(fg) do
  vim.api.nvim_set_hl(0, item, { fg = '#e6e6e6' })
end

local bg = {
  'LazyNormal',
  'ScissorsBackdrop',
  'DiagnosticVirtualTextHint',
  'WhichKeyNormal',
  'TroubleNormal',
  'TroubleNormalNC',
  'BufferTabpageFill',
  'BufferDefaultCurrent',
  'BufferDefaultCurrentChanged',
  'NeoTreeEndOfBuffer',
  'NeoTreeNormalNC',
  'NeoTreeNormal',
  'BufferInactive',
  'BufferDefaultTabpagesSep',
  'BufferDefaultInactiveSign',
}

for _, item in ipairs(bg) do
  vim.api.nvim_set_hl(0, item, { bg = '#15191f' })
end

local bg_fg = { 'FloatBorder', 'NeoTreeVertSplit', 'NeoTreeWinSeparator' }

for _, item in ipairs(bg_fg) do
  vim.api.nvim_set_hl(0, item, { bg = '#15191f', fg = '#e6e6e6' })
end

local marking = { 'Visual', 'Beacon' }

for _, item in ipairs(marking) do
  vim.api.nvim_set_hl(0, item, { bg = '#444444' })
end

vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'LeapMatch', {
  fg = 'white',
  bold = true,
  nocombine = true,
})
