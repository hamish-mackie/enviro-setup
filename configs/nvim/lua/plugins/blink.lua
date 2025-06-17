return {
    "saghen/blink.cmp",
    event = "InsertEnter", -- lazy-load on insert
    dependencies = {
        -- snippet engine & bridge
        "L3MON4D3/LuaSnip",
        -- sources you were using under nvim-cmp
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",

        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        -- Mason & LSP installer
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/schemastore.nvim",
        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        },
    },
    config = function()
        require("cmp").setup({})
        local blink_cmp = require("blink.cmp")

        blink_cmp.setup({
            keymap = { preset = "default" },
            completion = {
                documentation = { auto_show = false },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" }, -- Removed "nvim_lua"
                per_filetype = {
                    python = { inherit_defaults = true, "lsp", "path", "snippets", "buffer" },
                    gitcommit = { "buffer" },
                },
            },
            snippets = {
                preset = "luasnip",
            },
            fuzzy = {
                implementation = "lua", --"prefer_rust_with_warning"
                sorts = {
                    function(a, b)
                        if a.source_id == "lsp" and b.source_id ~= "lsp" then
                            return true
                        end
                        if b.source_id == "lsp" and a.source_id ~= "lsp" then
                            return false
                        end
                    end,
                    "score",
                    "sort_text",
                },
            },
        })
    end,
}
