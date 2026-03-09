-- ~/.config/nvim/lsp/jinja_lsp.lua

local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
	caps = blink.get_lsp_capabilities(caps)
end

-- Resolve binary robustly
local jinja_cmd = vim.fn.exepath("jinja-lsp")
if jinja_cmd == "" then
	jinja_cmd = vim.fn.expand("~/.cargo/bin/jinja-lsp")
end

return {
	cmd = { jinja_cmd },
	filetypes = { "jinja", "jinja2", "j2" },
	settings = { lang = "python" },
	capabilities = caps,
}
