" Plugins / Make sure you use single quotes
call plug#begin(stdpath('data') . '/plugged')
" Color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
" Interface
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim', { 'do': ':UpdateRemotePlugins' }
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim'
" Python
Plug 'deoplete-plugins/deoplete-jedi'
" Ruby
Plug 'vim-ruby/vim-ruby'
call plug#end()

" Load plugin settings
runtime! plugins/*.vim

" Color scheme
colorscheme iceberg

" Settings
set background=dark
set completeopt=menuone,noinsert
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

" Key mappings
" Deoplete
inoremap <expr><CR>  pumvisible() ? "<C-y>"  : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>"   : "<C-p>"
" Defx
nnoremap <silent> ;d :<C-u>Defx<CR>
