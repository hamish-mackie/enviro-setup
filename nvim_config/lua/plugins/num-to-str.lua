return {
	"numToStr/Comment.nvim",
	lazy = false, -- Set to true if you want to load on specific events
	config = function()
		require("Comment").setup({
			-- Optional custom settings (default is usually good)
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		})
	end,
}
