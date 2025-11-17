vim.lsp.config("ansiblels", {
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "yaml", "yml", "ansible" },

	root_dir = function(bufnr, on_dir)
		local name = vim.api.nvim_buf_get_name(bufnr)
		local dir = vim.fs.dirname(name)
		local found = vim.fs.find({ "ansible.cfg", ".ansible-lint", ".git" }, { path = dir, upward = true })[1]

		local root = found and vim.fs.dirname(found) or vim.loop.cwd()
		on_dir(root)
	end,

	settings = {
		ansible = {
			ansible = {
				path = "ansible",
			},
			executionEnvironment = {
				enabled = false,
			},
			python = {
				interpreterPath = "python",
			},
			validation = {
				enabled = true,
				lint = {
					enabled = true,
					path = "ansible-lint",
				},
			},
		},
	},
})

vim.lsp.enable("ansiblels")
