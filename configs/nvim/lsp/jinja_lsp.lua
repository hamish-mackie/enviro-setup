local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Resolve binary robustly
local jinja_cmd = vim.fn.exepath("jinja-lsp")
if jinja_cmd == "" then
	jinja_cmd = vim.fn.expand("~/.cargo/bin/jinja-lsp")
end

-- Treat *.yaml.j2 as Jinja
vim.filetype.add({
	pattern = {
		[".*%.ya?ml%.j2"] = "jinja",
	},
})

vim.lsp.config("jinja_lsp", {
	cmd = { jinja_cmd },
	filetypes = { "jinja", "jinja2", "j2" },
	settings = { lang = "python" },
	capabilities = capabilities,
})

vim.lsp.enable("jinja_lsp")
