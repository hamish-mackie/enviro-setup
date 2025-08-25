local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Prefer clangd-15, fallback to clangd
local candidates = { "clangd-15", "clangd" }
local clangd_cmd = nil
for _, c in ipairs(candidates) do
    local path = vim.fn.exepath(c)
    if path ~= "" then
        clangd_cmd = path
        break
    end
end

lspconfig.clangd.setup({
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
    cmd = {
        clangd_cmd,
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--clang-tidy-checks=-*,performance-*,modernize-*,readability-*,clang-analyzer-*",

        -- === Optional performance tweaks ===
        -- "--pch-storage=memory",       -- Keep precompiled headers in RAM (faster, but more memory)
        -- "--all-scopes-completion",    -- Show completions from all scopes, not just the current one
        "--limit-results=500", -- Limit number of completion results (default 100)
        -- "--limit-references=1000",    -- Cap number of references returned by "find references"

        -- === Diagnostics and linting ===
        -- "--clang-tidy-checks=*",      -- Run *all* clang-tidy checks (can be noisy and slow)
        -- "--suggest-missing-includes", -- Suggest #includes for missing symbols
        "--cross-file-rename", -- Enable renaming across files (experimental)
    },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd", ".git"),
})
