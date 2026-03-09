local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
	caps = blink.get_lsp_capabilities(caps)
end

return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	capabilities = caps,
	root_markers = { "pyproject.toml", ".git" },
}
