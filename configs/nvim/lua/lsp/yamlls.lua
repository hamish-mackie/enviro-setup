vim.lsp.config("yamlls", {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yml" },

	root_dir = function(bufnr, on_dir)
		local name = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(name, { ".git", "ansible.cfg", "package.json" }) or vim.fs.dirname(name)
		on_dir(root)
	end,

	settings = {
		yaml = {
			schemas = {},
			validate = true,
			hover = true,
			completion = true,
		},
	},
})
