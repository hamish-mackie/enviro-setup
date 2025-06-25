return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        {
            "nvim-telescope/telescope-ui-select.nvim"
        },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font
        },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    width = 0.8,
                    height = 0.8,
                },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
                find_command = { "fd", "--type", "f" } -- "--strip-cwd-prefix"
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case", -- or "ignore_case", "respect_case"
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
    end,
}
