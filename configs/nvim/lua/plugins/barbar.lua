return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- optional, for git status
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    init = function()
        -- Disable barbar's automatic setup so that our settings take effect.
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup({
            animation = true, -- enable animations when switching buffers
            auto_hide = false, -- don't auto-hide the tabline when only one buffer is open
            tabpages = true, -- integrate tab pages into the bufferline
            clickable = true, -- allow clicking on tabs to switch buffers
            exclude_ft = { "NvimTree", "terminal" }, -- filetypes to exclude from the tabline
            icons = {
                buffer_index = true, -- display the buffer index for quick navigation
                button = "", -- symbol for the close button
                filetype = {
                    enabled = true, -- enable filetype icons for buffers
                },
                separator = { left = "▎", right = "" }, -- separators between buffers
                modified = { button = "●" }, -- indicator for modified buffers
                pinned = { button = "車", filename = true }, -- settings for pinned buffers
                preset = "default", -- use the default icon preset
            },
            sidebar_filetypes = {
                -- Integrate with file explorers or other sidebar plugins
                NvimTree = { text = "File Explorer", icon = "", separator = true, highlight = true },
                Outline = { text = "Symbols", icon = "", separator = false, highlight = true },
            },
            custom_filter = function(buf_number)
                -- Exclude certain buffers from showing up in the tabline.
                local ft = vim.bo[buf_number].filetype
                if ft == "terminal" or ft == "NvimTree" then
                    return false
                end
                return true
            end,
        })
    end,
}
