" Plugins / Make sure you use single quotes
call plug#begin(stdpath('data') . '/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
" Color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
" Interface
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddu.vim'
Plug 'Shougo/ddu-ui-ff'
Plug 'Shougo/ddu-source-file_rec'
Plug 'shun/ddu-source-rg'
Plug 'Shougo/ddu-filter-matcher_substring'
Plug 'Shougo/ddu-kind-file'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Go
Plug 'mattn/vim-goimports'
" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim'
" Ruby
Plug 'vim-ruby/vim-ruby'
" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Utils
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" Load plugin settings
runtime! plugins/*.vim

" Color scheme
colorscheme iceberg

" Settings
set background=dark
set clipboard+=unnamed
set completeopt+=noinsert
set cursorline
set expandtab
set noincsearch
set number
set pumblend=15
set scrolloff=5
set shiftwidth=2
set tabstop=2
set termguicolors
set title
set ttimeoutlen=10

" Key mappings(basic)
nmap bb :ls<CR>:buf 
