return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
        local lspconfig    = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        for _, server in ipairs({ "clangd", "pyright", "lua_ls", "jsonls",
            "yamlls", "ansiblels", "protols", "jinja_lsp" }) do
            lspconfig[server].setup({ capabilities = capabilities })
        end
    end,
}
