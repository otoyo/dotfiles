let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
" Denite
nmap <silent> ;f  :<C-u>Denite -start-filter file/rec<CR>
nmap <silent> ;F  :<C-u>DeniteProjectDir -start-filter file/rec<CR>
nmap <silent> ;;f :<C-u>DeniteProjectDir file_mru<CR>
nmap <silent> ;g  :<C-u>DeniteProjectDir grep:::<C-r><C-w><CR>
nmap <silent> ;G  :<C-u>DeniteProjectDir grep:::<C-r><C-a><CR>
nmap <silent> ;;g :<C-u>Denite grep<CR>
nmap <silent> ;;G :<C-u>DeniteProjectDir grep<CR>
nmap <silent> ;r  :<C-u>Denite -resume<CR>
" Defx
nnoremap <silent> ;d :<C-u>Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>
" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
