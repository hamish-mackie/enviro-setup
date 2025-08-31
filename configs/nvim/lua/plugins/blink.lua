return {
  "saghen/blink.cmp",
  version = "*",            -- pin to a tag for prebuilt matcher
  event = "InsertEnter",
  -- build = "cargo +nightly build --release", -- only if building from main
  dependencies = {
    "L3MON4D3/LuaSnip",
    -- "rafamadriz/friendly-snippets",
    -- "folke/lazydev.nvim",         -- Lua API docs/completion (optional)
    -- "moyiz/blink-emoji.nvim",     -- emoji source for blink (optional)
  },
  config = function()
    require("blink.cmp").setup({
      keymap = { preset = "super-tab" },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 150 },
        ghost_text = { enabled = false },
        accept = { auto_brackets = { enabled = true } },        -- optional
        menu = { draw = { treesitter = { "lsp" } } },           -- optional
      },
      signature = { enabled = true },                           -- optional
      snippets = { preset = "luasnip" },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = { "exact", "score", "sort_text" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = { score_offset = 5 },
          snippets = { score_offset = -3 },
          -- emoji = { module = "blink-emoji", name = "Emoji", score_offset = -4 },
        },
        per_filetype = {
          python = { inherit_defaults = true },
          cpp    = { inherit_defaults = true },
          gitcommit = { "buffer" },
        },
      },
      cmdline = {
        enabled = true,
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true }, ghost_text = { enabled = true } },
      },
    })
  end,
}

