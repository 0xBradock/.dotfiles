" Numbers on the side
set number
set relativenumber
set signcolumn=yes

" General experience
set nohlsearch
set incsearch
set noerrorbells
set nowrap
set scrolloff=8
set noswapfile
set hidden

" Completion
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Tabs with 2 spaces
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Cursor
set cursorline

" Command line
set cmdheight=2

call plug#begin()
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" Lualine
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Comments
Plug 'tpope/vim-commentary'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completion
Plug 'hrsh7th/nvim-cmp'       " Core plugin
Plug 'hrsh7th/cmp-nvim-lsp'   " Auto import on complete
Plug 'hrsh7th/cmp-vsnip'      " Snippet completion source
Plug 'hrsh7th/cmp-buffer'     " Completes from curent buffer
Plug 'hrsh7th/cmp-path'       " Files completions§
Plug 'hrsh7th/cmp-cmdline'    " Command completions

" Snippets
Plug 'L3MON4D3/LuaSnip'             " Snippet Engine
Plug 'rafamadriz/friendly-snippets' " Collection of snippets
" [Rust]
Plug 'simrat39/rust-tools.nvim'   " Enable extra feature of rust-analyzer

call plug#end()

colorscheme dracula

" Moving block of highlighted lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Moving current line
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" Auto matching
inoremap " ""<left>
inoremap ' ''<left>
inoremap [ []<left>
inoremap [] []
inoremap ( ()<left>
inoremap () ()
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

