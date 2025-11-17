local caps = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("clangd", {
	cmd = { "clangd-15" },
	capabilities = caps,
	filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
	root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
})
