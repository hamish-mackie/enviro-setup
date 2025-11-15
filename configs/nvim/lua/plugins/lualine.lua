return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- for icons
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},

		-- custom LSP-progress component
		extensions = {},
		-- helper to poll Neovim's built-in progress messages
		lualine_components = {
			lsp_progress = function()
				local msgs = vim.lsp.util.get_progress_messages()
				if #msgs == 0 then
					return ""
				end
				local m = msgs[1]
				-- format: "⟳ DoingThing 42%"
				return string.format(
					"⟳ %s%s %d%%%%",
					m.title or "",
					m.message and (": " .. m.message) or "",
					m.percentage or 0
				)
			end,
		},

		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			-- show filename *and* LSP progress
			lualine_c = { { "filename", path = 1 }, "lsp_progress" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},

		tabline = {},
		winbar = {},
		inactive_winbar = {},
	},
}
