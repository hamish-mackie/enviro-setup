-- ~/.config/nvim/lsp/ansiblels.lua

return {
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "yaml", "yml", "ansible" },

	-- If root_markers is enough, prefer it (simpler and faster):
	root_markers = { "ansible.cfg", ".ansible-lint", ".git" },

	-- If you specifically want the callback-style root_dir, keep this instead
	-- (and delete root_markers above):
	-- root_dir = function(bufnr, on_dir)
	--   local name = vim.api.nvim_buf_get_name(bufnr)
	--   local dir = vim.fs.dirname(name)
	--   local found = vim.fs.find({ "ansible.cfg", ".ansible-lint", ".git" }, { path = dir, upward = true })[1]
	--   local root = found and vim.fs.dirname(found) or vim.loop.cwd()
	--   on_dir(root)
	-- end,

	settings = {
		ansible = {
			ansible = { path = "ansible" },
			executionEnvironment = { enabled = false },
			python = { interpreterPath = "python" },
			validation = {
				enabled = true,
				lint = { enabled = true, path = "ansible-lint" },
			},
		},
	},
}
