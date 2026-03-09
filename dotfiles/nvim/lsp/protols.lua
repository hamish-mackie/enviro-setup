vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end
		if client.name ~= "protols" then
			return
		end

		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

return {
	cmd = { "protols" },
	filetypes = { "proto" },
	root_markers = { "buf.work.yaml", "buf.yaml", ".git" },
}
