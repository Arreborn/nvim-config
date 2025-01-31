-- neovide settings
if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_normal_opacity = 0.9
  vim.g.neovide_window_blurred = true
  vim.g.transparency = 0.8
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_floating_corner_radius = 1
  vim.cmd 'set winblend=80'
  vim.o.guifont = 'JetBrainsMono Nerd Font Propo:h13'
  local default_path = vim.fn.expand '~'
  vim.api.nvim_set_current_dir(default_path)
end
