return {
    "pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            enabled = true,
            execution_message = {
                message = function()
                    return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                end,
                dim = 0.18,
                cleaning_interval = 1250,
            },
            trigger_events = { "VimLeave", "BufLeave" }, -- trigger auto-save on window/ buffer exit
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                -- Check for modifiable buffer and valid file type
                if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    -- Exclude when the last change was an undo operation
                    local undotime = vim.fn.undotree().seq_cur
                    if undotime == 0 then -- No undo action
                        return true
                    end
                end
                return false
            end,
            write_all_buffers = false,
            debounce_delay = 135,
            callbacks = {
                enabling = nil,
                disabling = nil,
                before_asserting_save = nil,
                before_saving = nil,
                after_saving = nil
            }
        })
    end,
}
