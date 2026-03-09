local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
	caps = blink.get_lsp_capabilities(caps)
end

return {
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
}
