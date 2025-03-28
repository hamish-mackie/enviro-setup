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
		require("gitsigns").setup(opts)
	end,
}
