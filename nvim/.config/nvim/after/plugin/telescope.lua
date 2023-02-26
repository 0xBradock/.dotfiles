local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { builtin.find_files, "Find File - (.gitignore)" },
      g = { "<cmd>Telescope find_files no_ignore=true hidden=true<cr>", "Find File + (.gitignore)" },
      w = { builtin.live_grep, "RipGrep" },
      s = { builtin.treesitter, "Symbols (treesitter)" },
      c = { builtin.git_commits, "List commits + diff" },
    },
  },
})

local telescope = require('telescope')
telescope.setup {
  defaults = {
    prompt_prefix = '  ',
  },
}
