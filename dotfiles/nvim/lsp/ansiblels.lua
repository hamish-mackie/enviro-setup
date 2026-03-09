return {
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "ansible" },
	root_markers = { "ansible.cfg", ".ansible-lint", ".git" },

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
