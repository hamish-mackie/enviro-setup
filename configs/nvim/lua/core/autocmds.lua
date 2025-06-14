vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client:supports_method("textDocument/documentHighlight") then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.defer_fn(function()
            local api = require("nvim-tree.api")
            api.tree.open()
            vim.cmd("wincmd p") -- switch back to previous window
        end, 50)
    end,
})

-- Automatically reload file when opened
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "checktime",
})
