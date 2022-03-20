local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- LEADER
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL
-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- INSERT
keymap("i", "jk", "<ESC>", opts)

-- VISUAL
keymap("v", "jk", "<ESC>", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
keymap("n", "ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
