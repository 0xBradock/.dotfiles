local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    a = {
      name = "harpoon",
      a = { mark.add_file, "Add file" },
      e = { ui.toggle_quick_menu, "Show files" },
    },
  }
})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'harpoon 1 file' })
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = 'harpoon 2 file' })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = 'harpoon 3 file' })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = 'harpoon 4 file' })

