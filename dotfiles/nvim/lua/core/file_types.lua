vim.filetype.add({
	extension = { j2 = "jinja" },
	pattern = {
		[".*%.ya?ml%.j2"] = "jinja",
		[".*%.xml%.j2"] = "jinja",
		[".*%.html%.j2"] = "jinja",
		[".*%.yaml%.j2"] = "jinja",
	},
})
