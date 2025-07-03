-- Highlights the word under the cursor using LSP, when supported
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client:supports_method("textDocument/documentHighlight") then
            -- When cursor is held, highlight symbol references
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })
            -- Clear highlight when cursor moves
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

-- Automatically open nvim-tree when Neovim launches, but switch back to the previous window
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.defer_fn(function()
            local api = require("nvim-tree.api")
            api.tree.open()
            vim.cmd("wincmd p") -- Return focus to previous window
        end, 50)
    end,
})

-- auto reload
-- 1. Tell Neovim to keep an eye on the mtime of every file you edit
vim.opt.autoread = true

-- 2. Regularly ask Neovim “has the file on disk changed?”
--    (we do it whenever the window regains focus, or you pause typing)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    command = "checktime",
})

-- 3. Nice-to-have: show a little toast when the file *was* reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.notify("Buffer reloaded – file changed on disk", vim.log.levels.INFO, { title = "autoread" })
    end,
})



-- Briefly highlight yanked (copied) text for visual feedback
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
})

-- Enable relative line numbers only in the active window and in normal mode
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave", "WinEnter", "WinLeave" }, {
    callback = function()
        local rnu = vim.bo[vim.api.nvim_get_current_buf()].modifiable and vim.fn.mode() == "n"
    end,
})

-- Restore cursor position to where you left off when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, "\"")[1]
        if mark > 1 and mark <= vim.api.nvim_buf_line_count(0) then
            pcall(vim.cmd, 'normal! g`"')
        end
    end,
})
