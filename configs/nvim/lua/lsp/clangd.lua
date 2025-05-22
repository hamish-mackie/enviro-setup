return {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--clang-tidy-checks=-*,performance-*,modernize-*,readability-*,clang-analyzer-*",
    },
    root_markers = { "compile_commands.json", "compile_flags.txt" },
}
