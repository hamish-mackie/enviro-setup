return {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("monokai-pro").setup({
            -- Choose one of: "classic", "octagon", "pro", "machine", "ristretto", "spectrum"
            filter = "pro",
            transparent_background = false, -- Set to true if you want no background in your editor
            terminal_colors = true, -- Use terminal colors
            devicons = true,       -- Enable file type icons (if supported by your plugin setup)

            -- Customize styles for specific syntax groups
            styles = {
                comment = { italic = true },
                keyword = { italic = true },
                functions = {},
                variables = {},
                types = { italic = false },
            },

            -- Optionally override specific highlight groups
            override = function(c)
                return {
                    Normal = { bg = c.base00 },
                    Visual = { bg = c.base03 },
                    LineNr = { fg = c.base0D },
                    CursorLineNr = { fg = c.base08, bold = true },
                    -- Add additional custom highlights as needed:
                    -- Identifier = { fg = c.base0E, bold = true },
                }
            end,

            -- Integrations with other plugins
            integrations = {
                treesitter = true,
                telescope = true,
                nvimtree = true,
                cmp = true,
                lsp = true,
                -- Enable additional integrations if desired
            },
        })
    end,
}
