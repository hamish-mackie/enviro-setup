vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.HINT }, -- show info, warning, error (skip hints)
        source = "if_many", -- show the source name (e.g. clangd) if multiple LSPs
        prefix = '●', -- symbol shown before each diagnostic message
        spacing = 2, -- space between text and line
    },
    signs = true, -- show signs in the gutter (e.g. ❗)
    underline = true, -- underline problem areas in the code
    update_in_insert = false, -- don't show diagnostics while typing (only after leaving insert mode)
    severity_sort = true, -- sort diagnostics by severity in loclist/qflist
})

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
