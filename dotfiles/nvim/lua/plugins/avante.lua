return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	version = false,
	opts = {
		provider = "openai",
		instructions_file = "avante.md",

		providers = {
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-5-mini", -- swap to whatever OpenAI model you want
				timeout = 30000,
				extra_request_body = {
					temperature = 0,
				},
			},
		},

		behaviour = {
			enable_fastapply = false,
		},

		mode = "agentic", -- safer to start with
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"folke/snacks.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "Avante" },
			opts = {
				file_types = { "markdown", "Avante" },
			},
		},
	},
}
