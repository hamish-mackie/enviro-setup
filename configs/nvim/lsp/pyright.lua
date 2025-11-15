-- ~/.config/nvim/lua/lsp/pyright.lua

-- blink capabilities
local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
    caps = blink.get_lsp_capabilities(caps)
end

-- detect {root}/.venv for pyright
local function venv_from_root(root)
    local venv = root .. "/.venv"
    if vim.fn.isdirectory(venv) == 1 then
        return { venvPath = root, venv = ".venv" }
    end
end

-- resolve project root
local function root_dir(fname)
    local found = vim.fs.find({
        "pyproject.toml", "setup.py", "setup.cfg",
        "requirements.txt", "Pipfile", "pyrightconfig.json", ".git"
    }, { path = fname, upward = true })[1]
    return found and vim.fs.dirname(found) or vim.loop.cwd()
end

vim.lsp.config("pyright", {
    capabilities = caps,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = root_dir,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "standard", -- off | basic | standard | strict
                autoImportCompletions = true,
                diagnosticMode = "workspace", -- or "openFilesOnly"
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                stubPath = "typings",
            },
        },
    },
    on_new_config = function(cfg, root)
        local v = venv_from_root(root)
        if v then
            cfg.settings.python.venvPath = v.venvPath
            cfg.settings.python.venv = v.venv
        end
    end,
})

vim.lsp.enable("pyright")
