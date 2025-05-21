-- treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- List of parsers to install
		ensure_installed = { "cpp", "python", "yaml", "json", "cmake", "ansible" },
		sync_install = false, -- install parsers asynchronously
		auto_install = true, -- automatically install missing parsers when entering buffer

		highlight = {
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
