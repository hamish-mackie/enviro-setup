local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--clang-tidy-checks=-*,performance-*,modernize-*,readability-*,clang-analyzer-*",
	},
})
