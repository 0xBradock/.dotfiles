local opt = vim.opt

-- Clipboard
opt.clipboard = "unnamedplus"

-- Diagnostics
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/
vim.diagnostic.config({
    -- TODO: I temporarily disabled virtual_text because it doubles with virtual_lines.
    -- virtual_text = { current_line = true },
    virtual_lines = { current_line = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
})

-- Indentation
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true

vim.opt.swapfile = false

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

-- Splits
vim.opt.splitright = true -- Split vertical to the right
vim.opt.splitbelow = true -- Split horizontal to the bottom

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
