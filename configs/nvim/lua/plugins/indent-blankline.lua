return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        enabled = false,
        indent = { char = "┊" },
        scope = {
            enabled = false,
            show_start = false,
            show_end = false,
        },
        exclude = {
            filetypes = { "help", "lazy", "nvimtree", "Trouble", "mason" },
            buftypes = { "terminal", "nofile" },
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)
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
                        indent = { char = "┊" },
                        scope = {
                            enabled = false,
                            show_start = false,
                            show_end = false,
                        },
                        exclude = {
                            filetypes = { "help", "lazy", "nvimtree", "Trouble", "mason" },
                            buftypes = { "terminal", "nofile" },
                        },
                    })
                    vim.notify("Indent guides: enabled")
                else
                    ibl.setup({ enabled = false })
                    vim.notify("Indent guides: disabled")
                end
            end,
            desc = "Utils: Toggle indent guides",
        },
    },
}
