local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    e = { "<cmd>NvimTreeToggle<CR>", "explorer" },
  }
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
