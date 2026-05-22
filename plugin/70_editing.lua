vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim", name = "mini.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs", name = "nvim-autopairs" },
	{ src = "https://github.com/folke/flash.nvim", name = "flash.nvim" },
	{ src = "https://github.com/nat-418/boole.nvim", name = "boole.nvim" },
	{ src = "https://github.com/ysmb-wtsg/in-and-out.nvim", name = "in-and-out.nvim" },
	{ src = "https://github.com/HiPhish/rainbow-delimiters.nvim", name = "rainbow-delimiters.nvim" },
	{ src = "https://github.com/chrisgrieser/nvim-recorder", name = "nvim-recorder" },
	{ src = "https://github.com/numToStr/Comment.nvim", name = "Comment.nvim" },
	{ src = "https://github.com/kevinhwang91/promise-async", name = "promise-async" },
	{ src = "https://github.com/luukvbaal/statuscol.nvim", name = "statuscol.nvim" },
	{ src = "https://github.com/kevinhwang91/nvim-ufo", name = "nvim-ufo" },
})

-- mini
require("mini.snippets").setup()
require("mini.ai").setup()
require("mini.sessions").setup({ directory = vim.fn.stdpath("config") .. "/session/" })
require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "gsn",
	},
})
vim.keymap.set("n", "<leader>!", "<cmd>mksession<cr>", { desc = "Make session" })

-- autopairs
require("nvim-autopairs").setup({})

-- flash
require("flash")
vim.api.nvim_set_hl(0, "FlashCurrent", { bold = false, fg = "#d19a66" })
vim.api.nvim_set_hl(0, "FlashMatch", { bold = false, fg = "#d19a66" })
vim.api.nvim_set_hl(0, "FlashLabel", { bold = true, fg = "#98c379", bg = "#404247" })
vim.api.nvim_set_hl(0, "FlashBackdrop", { italic = false, fg = "#646568" })

local map = vim.keymap.set
map({ "n", "x", "o" }, "s", function()
	require("flash").jump({
		search = {
			mode = function(str)
				return "\\<" .. str
			end,
		},
	})
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

-- boole
require("boole").setup({
	mappings = {
		increment = "<C-a>",
		decrement = "<C-x>",
	},
	allow_caps_additions = {
		{ "- [ ]", "- [x]" },
		{ "enable", "disable" },
		{ "present", "absent" },
		{ "dev", "prod" },
		{ "yes", "no" },
		{ "må", "ti", "on", "to", "fr", "lö", "sö" },
		{ "mån", "tis", "ons", "tor", "fre", "lör", "sön" },
		{ "måndag", "tisdag", "onsdag", "torsdag", "fredag", "lördag", "söndag" },
	},
})

-- in-and-out
map("i", "<S-CR>", function()
	require("in-and-out").in_and_out()
end)

-- rainbow-delimiters
vim.g.rainbow_delimiters = {
	highlight = {
		"RainbowDelimiterYellow",
		"RainbowDelimiterRed",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}

-- nvim-recorder
require("recorder").setup({
	mapping = {
		startStopRecording = "|",
		switchSlot = "<C-\\>",
		playMacro = "\\",
		editMacro = "c\\",
		deleteAllMacros = "d\\",
		yankMacro = "y\\",
	},
})

-- Comment.nvim
require("Comment").setup({})

-- statuscol + ufo
local builtin = require("statuscol.builtin")
require("statuscol").setup({
	relculright = true,
	segments = {
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{ text = { "%s" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})

require("ufo").setup({
	provider_selector = function()
		return { "treesitter", "indent" }
	end,
	fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
		local newVirtText = {}
		local suffix = (" 󰁂 %d lines "):format(endLnum - lnum)
		local sufWidth = vim.fn.strdisplaywidth(suffix)
		local targetWidth = width - sufWidth
		local curWidth = 0
		for _, chunk in ipairs(virtText) do
			local chunkText = chunk[1]
			local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if targetWidth > curWidth + chunkWidth then
				table.insert(newVirtText, chunk)
			else
				chunkText = truncate(chunkText, targetWidth - curWidth)
				local hlGroup = chunk[2]
				table.insert(newVirtText, { chunkText, hlGroup })
				chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if curWidth + chunkWidth < targetWidth then
					suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
				end
				break
			end
			curWidth = curWidth + chunkWidth
		end
		table.insert(newVirtText, { suffix, "MoreMsg" })
		return newVirtText
	end,
})

map("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "Open all folds" })
map("n", "zQ", function()
	require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
