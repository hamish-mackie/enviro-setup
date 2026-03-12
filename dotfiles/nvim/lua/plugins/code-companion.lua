return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			http = {
				openai = function()
					return require("codecompanion.adapters").extend("openai", {
						env = {
							api_key = "OPENAI_API_KEY",
						},
						opts = {
							stream = false,
						},
					})
				end,
				deepseek = function()
					return require("codecompanion.adapters").extend("openai", {
						env = {
							api_key = "DEEPSEEK_API_KEY",
						},
						url = "https://api.deepseek.com/chat/completions",
						schema = {
							model = {
								default = "deepseek-chat",
								choices = {
									"deepseek-chat",
									"deepseek-reasoner",
								},
							},
						},
					})
				end,
			},
		},

		interactions = {
			chat = {
				adapter = {
					name = "openai",
					model = "gpt-5-mini",
				},
			},
			inline = {
				adapter = {
					name = "openai",
					model = "gpt-5-mini",
				},
			},
			cmd = {
				adapter = {
					name = "openai",
					model = "gpt-5-mini",
				},
			},
			background = {
				adapter = {
					name = "deepseek",
					model = "deepseek-chat",
				},
			},
		},

		display = {
			diff = {
				enabled = true,
				close_chat_at = 240,
				layout = "vertical",
				opts = {
					"internal",
					"filler",
					"closeoff",
					"algorithm:patience",
					"followwrap",
					"linematch:120",
				},
			},
		},

		opts = {
			log_level = "TRACE",
			send_code = true,
			use_default_actions = true,
			use_default_prompts = true,
		},
	},

	--	keys = {
	--		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat" },
	--		{ "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "AI Actions" },
	--		{ "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "AI Inline" },
	--		{ "<leader>an", "<cmd>CodeCompanionChat<cr>", desc = "AI New Chat" },
	--		{ "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to AI chat" },
	--	},

	config = function(_, opts)
		require("codecompanion").setup(opts)
	end,
}
