local builtin = require("telescope.builtin")
local map = vim.keymap.set

-- Telescope Keymaps (From first config)
map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

map("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

map("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

map("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- Insert-mode cursor movements
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Misc
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear search highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy whole file" })

-- Toggles
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- Formatting
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "format file" })

-- LSP
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- LSP Keymaps (from first config)
map("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
map("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
map("n", "gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Toggle Inlay Hints
map("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "[T]oggle Inlay [H]ints" })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "toggle NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "focus NvimTree" })
