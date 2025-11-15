-- caps
local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
	caps = blink.get_lsp_capabilities(caps)
end

vim.lsp.config("lua_ls", {
	capabilities = caps,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_dir = function(fname)
		local found = vim.fs.find({ ".luarc.json", ".luacheckrc", ".git" }, { path = fname, upward = true })[1]
		return found and vim.fs.dirname(found) or vim.loop.cwd()
	end,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
			completion = { callSnippet = "Replace" },
		},
	},
	on_attach = function(client, bufnr) end,
})

vim.lsp.enable("lua_ls")
