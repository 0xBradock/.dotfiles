vim.g.mapleader = " "
-- spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- lines
vim.cmd("set nu")
vim.cmd("set relativenumber")
vim.opt.signcolumn="number"

-- movement
vim.keymap.set("i", "jj", "<Esc>", { desc = 'Ins to Nor' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move vis Line down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Vis line up' })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = 'Save' })

-- Keep the cursor centered when shifting code
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Keep cursor centered `J`' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Keep cursor centered page down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Keep cursor centered page up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Keep cursor centered searching' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Keep cursor centered searching' })

-- matching ([{
vim.keymap.set("i", "(", "()<ESC>ha", { desc = 'Match parenthesis' })
vim.keymap.set("i", "[", "[]<ESC>ha", { desc = 'Match brackets' })
vim.keymap.set("i", "{", "{}<ESC>ha", { desc = 'Match braces' })

vim.keymap.set("i", "( ", "(  )<ESC>hha", { desc = 'Match parenthesis space' })
vim.keymap.set("i", "[ ", "[  ]<ESC>hha", { desc = 'Match brackets space' })
vim.keymap.set("i", "{ ", "{  }<ESC>hha", { desc = 'Match braces space' })

vim.keymap.set("i", "(<CR>", "()<ESC>ha<CR><ESC>O", { desc = 'Match parenthesis' })
vim.keymap.set("i", "[<CR>", "[]<ESC>ha<CR><ESC>O", { desc = 'Match brackets <CR>' })
vim.keymap.set("i", "{<CR>", "{}<ESC>ha<CR><ESC>O", { desc = 'Match braces <CR>' })

-- matching '"`
vim.keymap.set("i", '"', '""<ESC>ha', { desc = 'Match double quotes' })
vim.keymap.set("i", "'", "''<ESC>ha", { desc = 'Match single quotes' })
vim.keymap.set("i", "`", "``<ESC>ha", { desc = "Match single quotes" })


-- search
vim.opt.incsearch=true
vim.opt.hlsearch=false

-- convenience
vim.opt.scrolloff=8
vim.opt.termguicolors=true
vim.opt.signcolumn="number"
vim.opt.cursorline=true

