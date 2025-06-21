return {
    "ojroques/nvim-osc52",
    config = function()
        -- Set up OSC52 with desired options
        require("osc52").setup({
            max_length = 0, -- 0 means unlimited (or set a limit if desired)
            silent = true, -- don't echo messages
            trim = false, -- don't trim whitespace
        })

        -- Create an autocmd that copies text via OSC52 after a yank operation
        vim.api.nvim_create_autocmd("TextYankPost", {
            callback = function()
                -- This copies the contents of the register that was just yanked
                require("osc52").copy_register(vim.v.event.regname)
            end,
            desc = "Copy yanked text to system clipboard via OSC52",
        })

        -- Optionally, you can also create a key mapping to trigger OSC52 manually:
        -- vim.keymap.set("n", "<leader>c", function()
        --   require("osc52").copy_register('"')
        -- end, { desc = "Copy using OSC52" })
    end,
}
