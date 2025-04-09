return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			clangd = {
				cmd = { "clangd", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu" },
			},
			pyright = {},
			lua_ls = {
				settings = { Lua = { completion = { callSnippet = "Replace" } } },
			},
		}

		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, { "stylua", "clang-format", "black" })

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded" },
			underline = true,
			virtual_text = true,
		})
	end,
}
