return {
  'tadaa/vimade',
  opts = {

    recipe = { 'default', { animate = false } },
    ncmode = 'buffers',
    fadelevel = 0.8,
    tint = {},
    basebg = '',
    blocklist = {
      default = {
        highlights = {
          laststatus_3 = function(win, active)
            if vim.go.laststatus == 3 then
              return 'StatusLine'
            end
          end,
          'TabLineSel',
        },
        buf_opts = { buftype = { 'prompt' } },
      },
      default_block_floats = function(win, active)
        return win.win_config.relative ~= '' and (win ~= active or win.buf_opts.buftype == 'terminal') and true or false
      end,
    },
    link = {},
    groupdiff = true,
    groupscrollbind = false,
    enablefocusfading = false,
    checkinterval = 1000,
    usecursorhold = false,
    nohlcheck = true,
  },
}
