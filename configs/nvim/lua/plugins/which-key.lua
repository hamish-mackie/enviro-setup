return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = {
				presets = {
					operators = false,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			win = { border = "single" },
			layout = { align = "center" },
			spec = {
				{
					mode = { "n", "v" }, -- applies to everything inside
					{ "<leader>b", group = "buffer" },
					{ "<leader>c", group = "code" },
					{ "<leader>d", group = "debug" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>l", group = "lsp" },
					{ "<leader>q", group = "quit/session" },
					{ "<leader>s", group = "search" },
					{ "<leader>u", group = "utils" },
					{ "<leader>t", group = "test/tasks" },
					{ "gc", group = "comment line" },
					{ "gb", group = "comment block" },
				},
			},
		},
	},
	{
		"echasnovski/mini.icons",
		version = false,
		lazy = true,
	},
}
