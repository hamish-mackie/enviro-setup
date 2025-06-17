local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    cmd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
        "clangd",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--clang-tidy-checks=-*,performance-*,modernize-*,readability-*,clang-analyzer-*",
    },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd", ".git"),
})
