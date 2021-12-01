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
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

" Key mappings
" Denite
nmap <silent> ;f  :<C-u>Denite -start-filter file/rec<CR>
nmap <silent> ;F  :<C-u>DeniteProjectDir -start-filter file/rec<CR>
nmap <silent> ;;f :<C-u>DeniteProjectDir file_mru<CR>
nmap <silent> ;g  :<C-u>DeniteProjectDir grep/ignore_test:::<C-r><C-w><CR>
nmap <silent> ;G  :<C-u>DeniteProjectDir grep:::<C-r><C-w><CR>
nmap <silent> ;;g :<C-u>Denite grep<CR>
nmap <silent> ;;G :<C-u>DeniteProjectDir grep<CR>
nmap <silent> ;r  :<C-u>Denite -resume<CR>
" Defx
nnoremap <silent> ;d :<C-u>Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>
" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
