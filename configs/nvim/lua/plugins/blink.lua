return {
	"saghen/blink.cmp",
	version = "*", -- pin to a tag for prebuilt matcher
	event = "InsertEnter",
	-- build = "cargo +nightly build --release", -- only if building from main
	dependencies = {
		"L3MON4D3/LuaSnip",
		"ribru17/blink-cmp-spell", -- spell check source
		"rafamadriz/friendly-snippets",
		-- "folke/lazydev.nvim",         -- Lua API docs/completion (optional)
		-- "moyiz/blink-emoji.nvim",     -- emoji source for blink (optional)
	},
	config = function()
		require("blink.cmp").setup({
			keymap = { preset = "super-tab" },
			appearance = { nerd_font_variant = "mono" },
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 150 },
				ghost_text = { enabled = false },
				accept = { auto_brackets = { enabled = true } },
				menu = { draw = { treesitter = { "lsp" } } },
			},
			signature = { enabled = true },
			snippets = { preset = "luasnip" },
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = { "exact", "score", "sort_text" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "spell" },
				providers = {
					lsp = { score_offset = 5 },
					snippets = { score_offset = -3 },
					spell = {
						name = "Spell",
						module = "blink-cmp-spell",
						opts = {
							max_entries = 5,
							preselect_current_word = true,
							use_cmp_spell_sorting = true,
							enable_in_context = function()
								-- only in text/markdown/gitcommit buffers
								return vim.bo.filetype == "text"
									or vim.bo.filetype == "markdown"
									or vim.bo.filetype == "gitcommit"
							end,
						},
					},
					-- emoji = { module = "blink-emoji", name = "Emoji", score_offset = -4 },
				},
				per_filetype = {
					python = { inherit_defaults = true },
					cpp = { inherit_defaults = true },
					gitcommit = { "buffer", "spell" },
				},
			},
			cmdline = {
				enabled = true,
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true }, ghost_text = { enabled = true } },
			},
		})
	end,
}
