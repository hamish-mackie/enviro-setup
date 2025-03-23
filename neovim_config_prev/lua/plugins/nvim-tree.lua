-- nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  -- Optionally include web-devicons for file icons:
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 45,           -- default width of 40 columns
        adaptive_size = true, -- automatically adjust width (if supported)
      },
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.open()
      end,
    })
  end,
}

