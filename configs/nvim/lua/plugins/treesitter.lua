return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
            "nvim-treesitter/nvim-treesitter-context",
            "windwp/nvim-ts-autotag",
            "HiPhish/rainbow-delimiters.nvim",
            "windwp/nvim-autopairs",
        },
        opts = {
            ensure_installed = {
                "cpp", "python", "yaml", "json", "cmake", "lua",
                "bash", "html", "javascript", "typescript", "markdown",
            },
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = true },

            -- Incremental Selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- init_selection = "gnn",
                    -- node_incremental = "grn",
                    -- scope_incremental = "grc",
                    -- node_decremental = "grm",
                },
            },

            -- Textobjects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ac"] = "@conditional.outer",
                        ["ic"] = "@conditional.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                },
            },

            -- Playground (for visualizing treesitter AST)
            playground = {
                enable = true,
                updatetime = 25,
                persist_queries = false,
            },

            -- Autotag for auto closing tags
            autotag = {
                enable = true,
            },

            -- Query Linter
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            require("treesitter-context").setup({})
            local npairs = require("nvim-autopairs")
            npairs.setup({
                check_ts = true, -- use Treesitter to avoid pairing in strings/comments
            })
        end,
    },
}
