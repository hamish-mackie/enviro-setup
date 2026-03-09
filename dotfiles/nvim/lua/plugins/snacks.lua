return {
	"folke/snacks.nvim",
	priority = 1000,
	---@type snacks.Config
	opts = {
		picker = { enabled = true, matcher = {
			frecency = true,
		} },
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		vim.api.nvim_set_hl(0, "SnacksPickerPath", { fg = "#9e9e9e" }) -- slightly darker
		vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#9e9e9e" }) -- slightly darker
		vim.api.nvim_set_hl(0, "SnacksPickerDetail", { fg = "#c0c0c0" }) -- keep readable
		vim.api.nvim_set_hl(0, "SnacksPickerDim", { fg = "#b8b8b8" }) -- dim text
	end,
}
