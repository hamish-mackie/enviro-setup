local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
	caps = blink.get_lsp_capabilities(caps)
end

return {
	cmd = { "clangd" },
	capabilities = caps,
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { ".git" },
}
