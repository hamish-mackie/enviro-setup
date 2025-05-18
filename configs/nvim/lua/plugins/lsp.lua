return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "b0o/schemastore.nvim" }, -- for JSON/YAML
		config = function()
			require("lsp.clangd")
			require("lsp.pyright")
			require("lsp.ansible")
			require("lsp.json")
			require("lsp.yaml")
		end,
	},
}
