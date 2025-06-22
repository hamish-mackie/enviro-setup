return {
    "saghen/blink.cmp",
    version = "1.*", -- Use pre-built fuzzy-matcher (recommended)
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "onsails/lspkind.nvim",
    },
    config = function()
        local blink_cmp = require("blink.cmp")
        local lspkind = require("lspkind")

        blink_cmp.setup({
            keymap = { preset = "super-tab" },
            completion = {
                documentation = { auto_show = false },
                ghost_text = { enabled = false },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            snippets = {
                preset = "luasnip",
            },
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning",
                sorts = {
                    -- prioritize LSP
                    function(a, b)
                        if a.source_id == "lsp" and b.source_id ~= "lsp" then return true end
                        if b.source_id == "lsp" and a.source_id ~= "lsp" then return false end
                    end,
                    "score",
                    "sort_text",
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = {
                    python    = { inherit_defaults = true, "lsp", "path", "snippets", "buffer" },
                    gitcommit = { "buffer" },
                },
            },
            cmdline = {
                enable = true,
                mappings = true, -- Uses `preset.cmdline()`
            },
        })
    end,
}
