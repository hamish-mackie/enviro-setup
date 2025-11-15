-- ~/.config/nvim/lua/lsp/clangd.lua

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Prefer clangd-15, fallback to clangd
local function resolve_clangd()
    for _, c in ipairs({ "clangd-15", "clangd" }) do
        local path = vim.fn.exepath(c)
        if path ~= "" then return path end
    end
    return "clangd"
end
local clangd_cmd = resolve_clangd()

-- Root dir using vim.fs
local function root_dir(fname)
    local found = vim.fs.find({ "compile_commands.json", ".clangd", ".git" }, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.loop.cwd()
end

vim.lsp.config("clangd", {
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
    cmd = {
        clangd_cmd,
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--clang-tidy-checks=-*,performance-*,modernize-*,readability-*,clang-analyzer-*",
        "--limit-results=500",
        "--cross-file-rename",
    },
    root_dir = root_dir,
})

vim.lsp.enable("clangd")
