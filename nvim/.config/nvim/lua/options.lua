local opt = vim.opt

-- Indentation
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true

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
vim.opt.scrolloff = 10       -- gard lines on top and bottom
vim.opt.updatetime = 200     -- debounce with 200ms
vim.opt.inccommand = 'split' -- preview substitution
vim.opt.cursorline = true    -- show line cursor is in

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
