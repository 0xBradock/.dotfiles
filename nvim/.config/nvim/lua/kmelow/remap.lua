vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = 'Netrw shortcut' })

vim.keymap.set("i", "jj", "<Esc>", { desc = '`jj` == ESC' })

-- Move selected block of code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move up selected line' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move down selected line' })

-- Keep the cursor centered when shifting code
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Keep cursor centered `J`' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Keep cursor centered page down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Keep cursor centered page up' })

-- Keep cursor centered
vim.keymap.set("n", "n", "nzzzv", { desc = 'Keep cursor centered searching' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Keep cursor centered searching' })

vim.keymap.set("x", "<leader>p", "\"_dP")

