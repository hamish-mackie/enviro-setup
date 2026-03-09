-- cmake-tools.lua
return {
	"Civitasv/cmake-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Make sure you have plenary
		-- "stevearc/overseer.nvim",  -- Optional if you want Overseer
		-- "akinsho/toggleterm.nvim"  -- Optional if you want ToggleTerm
	},
	config = function()
		require("cmake-tools").setup({
			-- Put your plugin config here.
			-- You can leave it empty to use defaults:
			-- cmake_command = "cmake",
			-- ...
		})
	end,
}
