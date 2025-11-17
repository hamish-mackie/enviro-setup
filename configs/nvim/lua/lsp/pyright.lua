local caps = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	capabilities = caps,
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"requirements.txt",
		"setup.py",
		"setup.cfg",
		".git",
	},
})
