vim.opt.fillchars:append({
	foldopen = "", -- symbol for open folds (like `-`)
	foldclose = "", -- symbol for closed folds (like `+`)
	fold = " ", -- background char for fold column
})

return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			provider_selector = function(_, filetype, _)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
