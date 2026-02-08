local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#141316', -- Default Background
    base01 = '#211f22', -- Lighter Background (status bars)
    base02 = '#2b292d', -- Selection Background
    base03 = '#958e99', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#ccc4cf', -- Dark Foreground (status bars)
    base05 = '#e7e1e5', -- Default Foreground
    base06 = '#e7e1e5', -- Light Foreground
    base07 = '#e7e1e5', -- Lightest Foreground
    -- Accent colors
    base08 = '#ffb4ab', -- Variables, XML Tags, Errors
    base09 = '#f2b7c1', -- Integers, Constants
    base0A = '#cfc2da', -- Classes, Search Background
    base0B = '#d8b9ff', -- Strings, Diff Inserted
    base0C = '#f2b7c1', -- Regex, Escape Chars
    base0D = '#d8b9ff', -- Functions, Methods
    base0E = '#cfc2da', -- Keywords, Storage
    base0F = '#93000a', -- Deprecated, Embedded Tags
  }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
