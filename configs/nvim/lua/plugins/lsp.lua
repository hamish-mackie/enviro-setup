return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "b0o/schemastore.nvim", -- Add this line
    },
    config = function()
        require("lsp.clangd")
        require("lsp.pyright")
        require("lsp.lua_ls")
        require("lsp.jsonls")
        require("lsp.yamlls")
        require("lsp.ansiblels")
        require("lsp.protols")
        require("lsp.jinja_lsp")
    end,
}

