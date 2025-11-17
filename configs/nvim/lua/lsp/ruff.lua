local caps = require("blink.cmp").get_lsp_capabilities()

local root_dir = function(fname)
	return vim.fs.root(fname, { "pyproject.toml", ".git" }) or vim.fs.dirname(fname)
end

vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	capabilities = caps,
	root_dir = root_dir,
})

vim.lsp.enable("ruff")
