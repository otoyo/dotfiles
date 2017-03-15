"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'bronson/vim-trailing-whitespace'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on

set ambiwidth=double
set autoindent
set directory=~/.vim/swp
set expandtab
set hlsearch
set number
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set t_Co=256
set tabstop=4

colorscheme jellybeans
