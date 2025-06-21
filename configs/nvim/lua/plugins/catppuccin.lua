return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- mocha, macchiato, frappe, latte
                integrations = {
                    telescope = true,
                    nvimtree = true,
                    treesitter = true,
                    mason = true,
                    cmp = true,
                    lsp_trouble = true,
                    -- add other integrations if desired
                },
            })
        end,
    },
}
