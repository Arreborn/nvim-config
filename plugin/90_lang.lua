vim.pack.add({
  { src = "https://github.com/nvim-java/nvim-java",                       name = "nvim-java" },
  { src = "https://github.com/bullets-vim/bullets.vim",                   name = "bullets.vim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", name = "render-markdown.nvim" },
})

vim.pack.add({
  {
    src = "https://github.com/JavaHello/spring-boot.nvim",
    version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
  },
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/mfussenegger/nvim-dap",

  "https://github.com/nvim-java/nvim-java",
})

require("java").setup()
vim.lsp.enable("jdtls")

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
