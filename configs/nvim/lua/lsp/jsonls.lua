local caps = require("blink.cmp").get_lsp_capabilities()

local root_dir = function(fname)
	local dir = vim.fs.dirname(fname)
	local found = vim.fs.find({ ".git", "package.json" }, { path = dir, upward = true })[1]
	return found and vim.fs.dirname(found) or dir
end

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	capabilities = caps,
	root_dir = root_dir,
})

vim.lsp.enable("jsonls")
