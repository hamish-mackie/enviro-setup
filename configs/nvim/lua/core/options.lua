vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

-- Show characters
vim.opt.list = true
vim.opt.listchars = {
    space = "·",
    trail = "•",
    tab = "»·",
    nbsp = "␣",
}

vim.opt.tabstop = 4      -- a real TAB is displayed as 4 spaces
vim.opt.shiftwidth = 4   -- >> and << use 4 spaces
vim.opt.softtabstop = 4  -- editing (e.g. <BS>) treats a tab as 4 spaces
vim.opt.expandtab = true -- insert spaces instead of real TABs
