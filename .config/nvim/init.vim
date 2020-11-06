" Plugins / Make sure you use single quotes
call plug#begin(stdpath('data') . '/plugged')
" Color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
" Interface
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
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
set noincsearch
set number
set pumblend=15
set scrolloff=5
set title
set ttimeoutlen=10
set termguicolors

" Key mappings
inoremap <expr><CR>  pumvisible() ? "<C-y>"  : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>"   : "<C-p>"
nmap <silent> ;f   :<C-u>Denite -buffer-name=denite-sp -start-filter file/rec file:new<CR>
nmap <silent> ;vf  :<C-u>Denite -buffer-name=denite-vs -start-filter file/rec file:new<CR>
nmap <silent> ;F   :<C-u>DeniteProjectDir -buffer-name=denite-sp -start-filter file/rec file:new<CR>
nmap <silent> ;vF  :<C-u>DeniteProjectDir -buffer-name=denite-vs -start-filter file/rec file:new<CR>
nmap <silent> ;;f  :<C-u>DeniteProjectDir -buffer-name=denite-sp file_mru<CR>
nmap <silent> ;;vf :<C-u>DeniteProjectDir -buffer-name=denite-vs file_mru<CR>
nmap <silent> ;g   :<C-u>DeniteProjectDir -buffer-name=denite-sp grep:::<C-r><C-w><CR>
nmap <silent> ;vg  :<C-u>DeniteProjectDir -buffer-name=denite-vs grep:::<C-r><C-w><CR>
nmap <silent> ;G   :<C-u>DeniteProjectDir -buffer-name=denite-sp grep:::<C-r><C-a><CR>
nmap <silent> ;vG  :<C-u>DeniteProjectDir -buffer-name=denite-vs grep:::<C-r><C-a><CR>
nmap <silent> ;;g  :<C-u>DeniteProjectDir -buffer-name=denite-sp grep<CR>
nmap <silent> ;;vg :<C-u>DeniteProjectDir -buffer-name=denite-vs grep<CR>
