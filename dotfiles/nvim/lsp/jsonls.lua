local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
	caps = blink.get_lsp_capabilities(caps)
end

return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	capabilities = caps,

	root_markers = { "package.json", ".git" },
}
