vim.filetype.add({
	extension = {
		j2 = "jinja",
	},
	pattern = {
		[".*%.ya?ml%.j2"] = "jinja",
		[".*%.xml%.j2"] = "jinja",
		[".*%.html%.j2"] = "jinja",

		[".*/playbooks/.*%.ya?ml"] = "ansible",
		[".*/roles/.*/tasks/.*%.ya?ml"] = "ansible",
		[".*/roles/.*/handlers/.*%.ya?ml"] = "ansible",
		[".*/roles/.*/defaults/.*%.ya?ml"] = "ansible",
		[".*/roles/.*/vars/.*%.ya?ml"] = "ansible",
	},
})
