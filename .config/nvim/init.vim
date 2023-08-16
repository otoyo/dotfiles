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
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddu.vim'
Plug 'Shougo/ddu-ui-ff'
Plug 'Shougo/ddu-ui-filer'
Plug 'Shougo/ddu-source-file'
Plug 'Shougo/ddu-source-file_rec'
Plug 'shun/ddu-source-rg'
Plug 'Shougo/ddu-filter-matcher_substring'
Plug 'Shougo/ddu-kind-file'
Plug 'Shougo/ddu-column-filename'
Plug 'Shougo/neomru.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
" Go
Plug 'mattn/vim-goimports'
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
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-H> :ls<CR>:buf 
