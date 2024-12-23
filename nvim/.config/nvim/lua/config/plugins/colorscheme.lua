return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
    }
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      local ayu = require("ayu")
      ayu.setup({
        overrides = {
          -- Normal = { bg = "None" },
          -- NormalFloat = { bg = "none" },
          -- ColorColumn = { bg = "None" },
          -- SignColumn = { bg = "None" },
          -- Folded = { bg = "None" },
          -- FoldColumn = { bg = "None" },
          -- CursorLine = { bg = "None" },
          -- CursorColumn = { bg = "None" },
          -- VertSplit = { bg = "None" },
        },
      })
    end
  }
}
