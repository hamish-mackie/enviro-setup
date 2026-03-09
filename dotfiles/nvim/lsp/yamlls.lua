return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yml" },
	root_markers = { ".git", "ansible.cfg", "package.json" },

	settings = {
		yaml = {
			schemas = {},
			validate = true,
			hover = true,
			completion = true,
		},
	},
}
