vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim", name = "which-key.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim", name = "toggleterm.nvim" },
	{ src = "https://github.com/folke/trouble.nvim", name = "trouble.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim", name = "todo-comments.nvim" },
	{ src = "https://github.com/chrisgrieser/nvim-scissors", name = "nvim-scissors" },
	{ src = "https://github.com/tpope/vim-sleuth", name = "vim-sleuth" },
	{ src = "https://github.com/sitiom/nvim-numbertoggle", name = "nvim-numbertoggle" },
})

require("which-key").setup({
	preset = "helix",
	keys = {
		scroll_down = "<c-a>",
		scroll_up = "<c-e>",
	},
	icons = {
		mappings = vim.g.have_nerd_font,
		keys = vim.g.have_nerd_font and {} or {
			Up = "<Up> ",
			Down = "<Down> ",
			Left = "<Left> ",
			Right = "<Right> ",
			C = "<C-…> ",
			M = "<M-…> ",
			D = "<D-…> ",
			S = "<S-…> ",
			CR = "<CR> ",
			Esc = "<Esc> ",
			ScrollWheelDown = "<ScrollWheelDown> ",
			ScrollWheelUp = "<ScrollWheelUp> ",
			NL = "<NL> ",
			BS = "<BS> ",
			Space = "<Space> ",
			Tab = "<Tab> ",
			F1 = "<F1>",
			F2 = "<F2>",
			F3 = "<F3>",
			F4 = "<F4>",
			F5 = "<F5>",
			F6 = "<F6>",
			F7 = "<F7>",
			F8 = "<F8>",
			F9 = "<F9>",
			F10 = "<F10>",
			F11 = "<F11>",
			F12 = "<F12>",
		},
	},
	spec = {
		{ "<leader>q", group = "[Q]uit", mode = { "n" } },
		{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
		{ "<leader>d", group = "[D]ebug" },
		{ "<leader>l", group = "Quickfix [L]ist" },
		{ "<leader>r", group = "[R]ename" },
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>w", group = "[W]orkspace" },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>gh", group = "[G]it [H]unk", mode = { "n", "v" } },
		{ "<leader>b", group = "[B]uffers", mode = { "n", "v" } },
		{ "<leader>g", group = "[G]it", mode = { "n" } },
		{ "<leader>h", group = "[H]elp", mode = { "n" } },
		{ "<leader>x", group = "[X] Snippets", mode = { "n", "v" } },
		{ "<leader>p", group = "[P]ickers", mode = { "n" } },
	},
})

require("toggleterm").setup({
	direction = "float",
	open_mapping = [[<leader>v]],
	float_opts = { border = "curved" },
})

require("trouble").setup({})

local map = vim.keymap.set
map("n", "<leader>hh", "<cmd>Trouble diagnostics toggle focus=false<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>hH", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>hb", "<cmd>Trouble symbols toggle focus=false win.size=0.2<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>hj",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>hg", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>hy", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

require("todo-comments").setup({
	keywords = {
		RESUBMIT = { icon = "", color = "error", alt = { "Komplettering" } },
		COMMENT = { icon = "", color = "warning", alt = { "Kommentar" } },
		TIP = { icon = "", color = "blue", alt = { "Tips", "Kommentar / Tips" } },
	},
	highlight = { keyword = "fg" },
	colors = {
		blue = { "SnacksPickerIconField", "#5FAFB9" },
	},
	signs = false,
})

require("scissors").setup({
	snippetDir = "~/.config/nvim/snippets/",
	snacks = { alsoSearchSnippetBody = false },
})
map("n", "<leader>xe", function()
	require("scissors").editSnippet()
end, { desc = "Snippet: Edit" })
map({ "n", "x" }, "<leader>xa", function()
	require("scissors").addNewSnippet()
end, { desc = "Snippet: Add" })
