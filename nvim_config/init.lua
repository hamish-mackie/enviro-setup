-- init.lua
vim.g.mapleader = " "

-- Bootstrap Lazy.nvim
require("core.lazy_setup")

-- Core setup
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load plugins
require("plugins")

-- Theme
-- vim.cmd.colorscheme("catppuccin")
vim.cmd("colorscheme monokai-pro")
