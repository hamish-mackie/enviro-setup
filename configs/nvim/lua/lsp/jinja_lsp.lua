local lspconfig = require("lspconfig")

lspconfig.jinja_lsp.setup {
    cmd = { "jinja-lsp" },
    filetypes = { "jinja", "jinja2", "j2" },
    settings = {
        lang = "python",
    },
    -- on_attach = function(client, bufnr) … end,
    -- flags = { debounce_text_changes = 150 },
}
