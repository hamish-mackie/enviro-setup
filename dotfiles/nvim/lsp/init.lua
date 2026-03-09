-- lua/lsp/init.lua

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- Load all LSP server configs
		local modules = {
			"lsp.ansiblels",
			"lsp.clangd",
			"lsp.jinja_lsp",
			"lsp.jsonls",
			"lsp.lua_ls",
			"lsp.protols",
			"lsp.pyright",
			"lsp.ruff",
			"lsp.yamlls",
		}

		for _, name in ipairs(modules) do
			local ok, err = pcall(require, name)
			if not ok then
				vim.schedule(function()
					vim.notify("LSP config failed for " .. name .. ": " .. err, vim.log.levels.ERROR)
				end)
			end
		end

		-- Register and enable all servers by name
		vim.lsp.enable({
			"ansiblels",
			"clangd",
			"jinja_lsp",
			"jsonls",
			"lua_ls",
			"protols",
			"pyright",
			"ruff",
			"yamlls",
		})
	end,
})
