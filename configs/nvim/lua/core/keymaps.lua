local builtin = require("telescope.builtin")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }


map("n", "<leader>s", "<Nop>", { desc = "[S]earch prefix" })
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

map("n", "<leader>g", "<Nop>", { desc = "[G]it" })
map(
    "n",
    "<leader>gsf",
    builtin.git_files,
    { desc = "[G]it [S]earch [F]iles" }
)
map("n", "<leader>gsc", builtin.git_commits, { desc = "[G]it [S]earch [C]ommits" })
map("n", "<leader>gsb", builtin.git_branches, { desc = "[G]it [S]earch [B]ranches" })
map("n", "<leader>gss", builtin.git_status, { desc = "[G]it [S]earch [S]tatus" })

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

-- Formatting
map("n", "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "format file" })

-- Definitions & Declarations
map("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

-- Type Definition
map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })

-- Workspace Symbols
map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

-- References, Implementations, Rename & Document Symbols (from second config)
map("n", "grr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
map("n", "gri", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
map("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map("n", "gO", vim.lsp.buf.document_symbol, { desc = "[D]ocument [S]ymbols" })
map({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map({ "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

map("n", "<leader>q", vim.diagnostic.setloclist, {
    noremap = true,
    silent = true,
    desc = "Open diagnostic [Q]uickfix list"
})

-- Toggle Inlay Hints
map("n", "<leader>th", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "[T]oggle Inlay [H]ints" })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "toggle NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "focus NvimTree" })

-- Copy to system clipboard
map("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })

-- In normal mode:
map("n", "<leader>yy", '"+yy', { desc = "Copy current line to system clipboard" })
map("n", "<leader>y", '"+y', { desc = "Copy motion to system clipboard" }) -- e.g. <leader>yw, <leader>y$ etc.
map("n", "<leader>Y", '"+yg_', { desc = "Copy to end of line to system clipboard" })


-- Paste from system clipboard
map("n", "<leader>p", '"+p') -- Paste after cursor in normal mode
map("n", "<leader>P", '"+P') -- Paste before cursor in normal mode
map("v", "<leader>p", '"+p') -- Paste over selection in visual mode
map("v", "<leader>P", '"+P') -- Paste before selection in visual mode

map("n", "<leader>c", function()
    require("osc53").copy_register('"')
end, { desc = "Copy using OSC53" })

-- barbar tabs
map("n", "<Tab>", ":BufferNext<CR>", opts)
map("n", "<S-Tab>", ":BufferPrevious<CR>", opts)
map("n", "<leader>tc", ":BufferClose<CR>", { desc = "[T]ab [C]lose" }, opts)

-- Buffers
map("n", "<leader>be", ":enew<CR>", { desc = "[B]uffer [E]new" })
map("n", "<leader>bd", ":bd<CR>", { desc = "[B]uffer [D]elete" })
map("n", "<leader>bl", ":ls<CR>", { desc = "[B]uffer [L]ist" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer [N]ext" })
map("n", "<leader>bp", ":bprev<CR>", { desc = "[B]uffer [P]revious" })

-- Splits
map("n", "<leader>bs|", ":vsplit<CR>", { desc = "[B]uffer [S]plit [V]ertical |" })
map("n", "<leader>bs-", ":split<CR>", { desc = "[B]uffer [S]plit [H]orizontal -" })

-- Toggle line comment (normal mode)
map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle line comment" })

-- Toggle block comment (normal mode)
map("n", "<leader>*", function()
    require("Comment.api").toggle.blockwise.current()
end, { desc = "Toggle block comment" })

-- Toggle line comment in visual mode
map("v", "<leader>/", function()
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle line comment (visual)" })

-- Toggle block comment in visual mode
map("v", "<leader>*", function()
    require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end, { desc = "Toggle block comment (visual)" })
