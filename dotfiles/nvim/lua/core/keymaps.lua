local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function sp(method, picker_opts)
	return function()
		require("snacks").picker[method](picker_opts or {})
	end
end

-- Snacks-based search keymaps
map(
	"n",
	"<leader>sf",
	sp("files", {
		hidden = true,
		ignored = true,
		follow = true,
	}),
	{ desc = "[S]earch [F]iles" }
)

map("n", "<leader>sh", sp("help"), { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", sp("keymaps"), { desc = "[S]earch [K]eymaps" })
map("n", "<leader>ss", sp("builtin"), { desc = "[S]earch [S]elect Picker" })
map("n", "<leader>sw", sp("grep_word"), { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", sp("grep"), { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", sp("diagnostics"), { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", sp("resume"), { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", sp("recent"), { desc = "[S]earch Recent Files" })
map("n", "<leader>sW", sp("lsp_workspace_symbols"), { desc = "[W]orkspace [S]ymbols" })

map("n", "<leader><leader>", sp("buffers"), { desc = "Find existing buffers" })
map("n", "<leader>sb", sp("buffer", { preview = false }), { desc = "Fuzzy search in current buffer" })
map(
	"n",
	"<leader>s/",
	sp("grep", {
		open_files = true,
		title = "Live Grep in Open Files",
	}),
	{ desc = "[S]earch [/] in Open Files" }
)
map(
	"n",
	"<leader>sn",
	sp("files", {
		cwd = vim.fn.stdpath("config"),
	}),
	{ desc = "[S]earch [N]eovim files" }
)

-- Git pickers
map("n", "<leader>gsf", sp("git_files"), { desc = "[G]it [S]earch [F]iles" })
map("n", "<leader>gsc", sp("git_log"), { desc = "[G]it [S]earch [C]ommits" })
map("n", "<leader>gsb", sp("git_branches"), { desc = "[G]it [S]earch [B]ranches" })
map("n", "<leader>gss", sp("git_status"), { desc = "[G]it [S]earch [S]tatus" })

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

-- Toggles
map("n", "<leader>un", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>urn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Formatting
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "format file" })

-- Definitions & Declarations
map("n", "gd", sp("lsp_definitions"), { desc = "[G]oto [D]efinition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

-- Type Definition
map("n", "<leader>D", sp("lsp_type_definitions"), { desc = "Type [D]efinition" })

-- References, Implementations, Rename & Document Symbols
map("n", "grr", sp("lsp_references"), { desc = "[G]oto [R]eferences" })
map("n", "gri", sp("lsp_implementations"), { desc = "[G]oto [I]mplementation" })
map("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map("n", "gO", sp("symbols"), { desc = "Document Symbols" })

map({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map({ "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

map("n", "<leader>q", vim.diagnostic.setloclist, {
	noremap = true,
	silent = true,
	desc = "Open diagnostic [Q]uickfix list",
})

-- Toggle Inlay Hints
map("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "[T]oggle Inlay [H]ints" })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "toggle NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "focus NvimTree" })

-- barbar tabs
map("n", "<Tab>", ":BufferNext<CR>", opts)
map("n", "<S-Tab>", ":BufferPrevious<CR>", opts)
map("n", "<leader>tc", ":BufferClose<CR>", { desc = "[T]ab [C]lose" })

-- Buffers
map("n", "<leader>be", ":enew<CR>", { desc = "[B]uffer [E]new" })
map("n", "<leader>bd", ":bd<CR>", { desc = "[B]uffer [D]elete" })
map("n", "<leader>bl", ":ls<CR>", { desc = "[B]uffer [L]ist" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer [N]ext" })
map("n", "<leader>bp", ":bprev<CR>", { desc = "[B]uffer [P]revious" })

-- Splits
map("n", "<leader>bs|", ":vsplit<CR>", { desc = "[B]uffer [S]plit [V]ertical |" })
map("n", "<leader>bs-", ":split<CR>", { desc = "[B]uffer [S]plit [H]orizontal -" })

-- Comments
map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle line comment" })

map("n", "<leader>*", function()
	require("Comment.api").toggle.blockwise.current()
end, { desc = "Toggle block comment" })

map("v", "<leader>/", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle line comment (visual)" })

map("v", "<leader>*", function()
	require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end, { desc = "Toggle block comment (visual)" })

-- which-key groups
local wk = require("which-key")

wk.add({
	-- Textobjects
	{ "a", group = "[a]round", mode = { "o", "x" } },
	{ "i", group = "[i]nside", mode = { "o", "x" } },
	{ "af", desc = "[f]unction outer", mode = { "o", "x" } },
	{ "if", desc = "[f]unction inner", mode = { "o", "x" } },
	{ "ac", desc = "[c]lass outer", mode = { "o", "x" } },
	{ "ic", desc = "[c]lass inner", mode = { "o", "x" } },
	{ "al", desc = "[l]oop outer", mode = { "o", "x" } },
	{ "il", desc = "[l]oop inner", mode = { "o", "x" } },
	{ "aC", desc = "[C]onditional outer", mode = { "o", "x" } },
	{ "iC", desc = "[C]onditional inner", mode = { "o", "x" } },

	-- Motions
	{ "]", group = "Next", mode = "n" },
	{ "[", group = "Prev", mode = "n" },
	{ "]m", desc = "Next function start", mode = "n" },
	{ "]]", desc = "Next class start", mode = "n" },
	{ "[m", desc = "Prev function start", mode = "n" },
	{ "[[", desc = "Prev class start", mode = "n" },
})

-- Visual mode indent reselect
vim.keymap.set("x", "<Tab>", ">gv")
vim.keymap.set("x", "<S-Tab>", "<gv")

-- yank
map("n", "<leader>yl", function()
	local file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	local line = vim.fn.line(".")
	local text = file .. ":" .. line
	vim.fn.setreg("+", text)
	print("Yanked " .. text)
end, { desc = "[Y]ank File:[L]ine" })

map("v", "<leader>yr", function()
	local file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	local text = file .. ":" .. start_line .. "-" .. end_line
	vim.fn.setreg("+", text)
	print("Yanked " .. text)
end, { desc = "[Y]ank [R]ange File:Lines" })

-- gitsigns
local gs = require("gitsigns")

vim.keymap.set("n", "]h", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]h", bang = true })
	else
		gs.nav_hunk("next")
	end
end, { desc = "Next Hunk" })

vim.keymap.set("n", "[h", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[h", bang = true })
	else
		gs.nav_hunk("prev")
	end
end, { desc = "Prev Hunk" })

vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
vim.keymap.set("v", "<leader>hs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage Hunk" })
vim.keymap.set("v", "<leader>hr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset Hunk" })

vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })

vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
vim.keymap.set("n", "<leader>hb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame Line" })

vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
vim.keymap.set("n", "<leader>hD", function()
	gs.diffthis("~")
end, { desc = "Diff This ~" })

vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
