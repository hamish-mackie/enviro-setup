return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			ignore = nil,

			toggler = {
				line = "<leader>/",
				block = "<leader>*",
			},
			opleader = {
				line = "<leader>c",
				block = "<leader>b",
			},

			mappings = {
				basic = false,
				extra = false,
			},

			pre_hook = nil,
			post_hook = nil,
		})
	end,
}
