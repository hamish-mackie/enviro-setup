local lspconfig = require("lspconfig")

lspconfig.lua_la.setup({
	lua_ls = {
		settings = { Lua = { completion = { callSnippet = "Replace" } } },
	},
})
