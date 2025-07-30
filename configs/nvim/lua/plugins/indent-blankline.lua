return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        enabled = false, -- off at startup
        indent = {
            char = "┊", -- base indent char
        },
        scope = {
            enabled = true,
            char = "│", -- thicker char for scope
            highlight = "IblScope",
            show_start = false,
            show_end = false,
        },
        exclude = {
            filetypes = { "help", "lazy", "nvimtree", "Trouble", "mason" },
            buftypes = { "terminal", "nofile" },
        },
    },
    config = function(_, opts)
        -- Apply initial opts (disabled by default)
        require("ibl").setup(opts)

        -- Style the scope highlight to make it bold (and optionally colored)
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#FFD700", bold = true })

        -- Track toggle state
        vim.g.__ibl_enabled = false
    end,
    keys = {
        {
            "<leader>ui",
            function()
                local ibl = require("ibl")
                vim.g.__ibl_enabled = not vim.g.__ibl_enabled
                if vim.g.__ibl_enabled then
                    ibl.setup({
                        enabled = true,
                        indent = {
                            char = "┊",
                        },
                        scope = {
                            enabled = true,
                            char = "│",
                            highlight = "IblScope",
                            show_start = false,
                            show_end = false,
                        },
                        exclude = {
                            filetypes = { "help", "lazy", "nvimtree", "Trouble", "mason" },
                            buftypes = { "terminal", "nofile" },
                        },
                    })
                    vim.notify("Indent guides: enabled", vim.log.levels.INFO)
                else
                    ibl.setup({ enabled = false })
                    vim.notify("Indent guides: disabled", vim.log.levels.INFO)
                end
            end,
            desc = "Utils: Toggle indent guides",
        },
    },
}
