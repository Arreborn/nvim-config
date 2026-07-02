vim.pack.add({
  { src = "https://github.com/bullets-vim/bullets.vim",                   name = "bullets.vim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", name = "render-markdown.nvim" },
})

require("render-markdown").setup({})
Snacks.toggle({
  name = "Render Markdown",
  get = function()
    return require("render-markdown.state").enabled
  end,
  set = function(enabled)
    local m = require("render-markdown")
    if enabled then
      m.enable()
    else
      m.disable()
    end
  end,
}):map("<leader>um")
