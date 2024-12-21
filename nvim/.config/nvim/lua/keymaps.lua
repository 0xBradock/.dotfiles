-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Conveniences
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set('n', '<space>w', '<cmd>w<CR>', { desc = 'Easy save' })

-- Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove highlight' })
-- Hard mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands - CTRL+<hjkl>
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Move windows
vim.keymap.set('n', '<M-h>', '<C-W>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<M-l>', '<C-W>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<M-j>', '<C-W>J', { desc = 'Move window to the bottom' })
vim.keymap.set('n', '<M-k>', '<C-W>K', { desc = 'Move window to the top' })

vim.keymap.set('n', '<M-,>', '<cmd>vertical resize -8<CR>', { desc = '' })
vim.keymap.set('n', '<M-.>', '<cmd>vertical resize +8<CR>', { desc = '' })

-- Prime moves: https://www.youtube.com/watch?v=w7i4amO_zaE
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor after page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor after page up' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlight down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlight up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Steady cursor when concat lines' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center cursor when searching' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center cursor when searching' })
vim.keymap.set('x', '<space>p', "\"_dP", { desc = 'Void when pasting on top' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Goto
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto Declaration' })

-- Quickfix
vim.keymap.set('n', '<M-n>', '<cmd>cnext<CR>zz', { desc = 'Next on Quickfixlist' })
vim.keymap.set('n', '<M-p>', '<cmd>cprev<CR>zz', { desc = 'Previous on Quickfixlist' })
vim.keymap.set('n', '<M-q>', '<cmd>cclose<CR>', { desc = 'Close Quickfixlist' })

-- LSP
vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', '<space>lq', vim.diagnostic.setqflist, { desc = 'Diagnostics to quickfixlist' })

-- Test
vim.keymap.set('n', '<space>tl', '<cmd>require("neotest").run.run(vim.fn.expand("%"))<CR>', { desc = 'Current file' })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil" })
