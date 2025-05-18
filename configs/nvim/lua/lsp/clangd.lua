local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
	},
})
