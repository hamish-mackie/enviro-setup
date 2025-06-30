return {
    "pocco81/auto-save.nvim",
    event = "VeryLazy",
    config = function()
        require("auto-save").setup({
            enabled           = true,

            execution_message = {
                message = function()
                    return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                end,
                dim = 0.18,
                cleaning_interval = 1250,
            },

            trigger_events    = { "BufLeave", "VimLeave" },
            condition         = function(buf)
                local fn    = vim.fn
                local utils = require("auto-save.utils.data")

                -- writable + *modified* + normal filetype
                if fn.getbufvar(buf, "&modifiable") == 1
                    and fn.getbufvar(buf, "&modified") == 1
                    and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) -- tweak if you want to exclude specific fts
                then
                    -- optional: ignore pure undo/redo noise
                    local undotree = fn.undotree()
                    if undotree and undotree.seq_cur == undotree.seq_last then
                        return true
                    end
                end
                return false
            end,

            write_all_buffers = false, -- never touch unrelated buffers
            debounce_delay    = 0,     -- not needed: we only listen to leave events
            callbacks         = {},    -- keep the table but empty
        })
    end,
}
