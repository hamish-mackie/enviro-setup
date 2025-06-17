local lspconfig = require("lspconfig")

lspconfig.protols.setup {
    on_attach = function(client, bufnr)
        -- disable auto-formatting
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- your other keymaps here…
    end,
}
