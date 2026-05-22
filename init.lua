vim.loader.enable()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.o.incsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.lsp.config("*", {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.lsp.config("puppet", {
	cmd = {
		"puppet-languageserver",
		"--stdio",
		"--timeout=0",
		"--no-stop",
		"--debug=/tmp/puppet-ls-nvim.log",
	},
	filetypes = { "puppet", "pp" },
	root_markers = {
		{ "metadata.json", "Puppetfile", "environment.conf" },
		".git",
	},
	settings = {
		["puppet.editorService.enable"] = true,
		["puppet.editorService.loglevel"] = "debug",
	},
})

vim.api.nvim_create_user_command("Update", function()
	vim.pack.update()
end, { desc = "Update all plugins" })

require("keybinds")

if vim.g.neovide then
	require("neovide")
end
