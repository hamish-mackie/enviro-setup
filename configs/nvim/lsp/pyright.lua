local lspconfig = require("lspconfig")
 local util = require("lspconfig.util")
 
 -- blink capabilities
 local caps = vim.lsp.protocol.make_client_capabilities()
 local ok, blink = pcall(require, "blink.cmp")
 if ok and blink.get_lsp_capabilities then
     caps = blink.get_lsp_capabilities(caps)
 end
 
 -- detect {root}/.venv for pyright
 local function venv_from_root(root)
     local venv = util.path.join(root, ".venv")
     if vim.fn.isdirectory(venv) == 1 then
         return { venvPath = root, venv = ".venv" }
     end
 end
 
 lspconfig.pyright.setup({
     capabilities = caps,
     root_dir = util.root_pattern(
         "pyproject.toml", "setup.py", "setup.cfg",
         "requirements.txt", "Pipfile", "pyrightconfig.json", ".git"
     ),
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
 
 -- Ruff setup (lint + format)
 lspconfig.ruff.setup({
     capabilities = caps,
     root_dir = util.root_pattern("pyproject.toml", ".git"),
     init_options = {
         settings = {
             args = {}, -- extra CLI args, e.g. {"--line-length=120"}
         },
     },
 })
