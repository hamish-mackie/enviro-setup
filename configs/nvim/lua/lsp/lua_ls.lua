vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_dir = function(bufnr, on_dir)
		local name = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(name, { ".luarc.json", ".luarc.jsonc", ".git" }) or vim.fs.dirname(name)
		on_dir(root)
	end,
})
