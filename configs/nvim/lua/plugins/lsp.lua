return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "b0o/schemastore.nvim" },
        config = function()
            require("lsp.clangd")
            require("lsp.pyright")
            require("lsp.ansiblels")
            require("lsp.jsonls")
            require("lsp.yamlls")
            require("lsp.lua_ls")
            require("lsp.protols")
            require("lsp.jinja_lsp")
        end,
    },
}
