-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Conveniences
vim.keymap.set('i', 'jk', '<ESC><cmd>w<CR>', { desc = 'Easy save' })

-- Space as tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Mouse options
vim.opt.mouse = 'ni'                -- normal and insert mode (resize window)
vim.opt.mousehide = true            -- hide when typing
vim.opt.mousescroll = 'ver:2,hor:4' -- lines and cols when scrolling

-- UI
vim.opt.showmode = false     -- hide extra line with mode description
vim.opt.signcolumn = 'yes'   -- allways keep space for sign column
vim.opt.list = true          -- displays hidden chars
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.cursorline = true    -- show line cursor is in
vim.opt.scrolloff = 10       -- gard lines on top and bottom
vim.opt.updatetime = 200     -- debounce with 200ms
vim.opt.inccommand = 'split' -- preview substitution

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

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
vim.keymap.set('n', '<C-H>', '<C-w><C-H>', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-L>', '<C-w><C-L>', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-J>', '<C-w><C-J>', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-K>', '<C-w><C-K>', { desc = 'Move window to the upper' })

-- Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor after page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor after page up' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Goto
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto Declaration' })

-- Quickfix
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Next on Quickfixlist' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'Previous on Quickfixlist' })
vim.keymap.set('n', '<M-q>', '<cmd>cclose<CR>', { desc = 'Close Quickfixlist' })

-- LSP
vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<space>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', '<space>lq', vim.diagnostic.setqflist, { desc = 'Diagnostics to quickfixlist' })
