return {
	"lewis6991/gitsigns.nvim",
	event = "User FilePost",
	opts = {
		signs = {
			delete = { text = "󰍵" },
			changedelete = { text = "󱕖" },
		},
	},
	config = function(_, opts)
		dofile(vim.g.base46_cache .. "git")
		require("gitsigns").setup(opts)
	end,
}
