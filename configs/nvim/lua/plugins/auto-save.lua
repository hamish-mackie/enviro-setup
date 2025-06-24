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

      -- save when leaving a window/buffer …
      trigger_events = { "VimLeave", "BufLeave" },

      -- … but only if the buffer *really* changed
      condition = function(buf)
        local fn    = vim.fn
        local utils = require("auto-save.utils.data")

        -- modifiable + **modified** + filetype allowed
        if fn.getbufvar(buf, "&modifiable") == 1
          and fn.getbufvar(buf, "&modified")  == 1   -- <─ NEW: skip if no edits
          and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
        then
          -- optional: still ignore pure undo/redo noise
          local undotree = vim.fn.undotree()
          if undotree and undotree.seq_cur == undotree.seq_last then
            return true
          end
        end
        return false
      end,

      write_all_buffers = false,
      debounce_delay    = 135,
      callbacks         = {
        enabling              = nil,
        disabling             = nil,
        before_asserting_save = nil,
        before_saving         = nil,
        after_saving          = nil,
      },
    })
  end,
}

