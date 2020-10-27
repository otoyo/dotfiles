let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'nanotech/jellybeans.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1
Plug 'slashmili/alchemist.vim'

" Python
Plug 'deoplete-plugins/deoplete-jedi'

" Ruby
Plug 'vim-ruby/vim-ruby'

call plug#end()

" deoplete
call deoplete#custom#option({
    \ 'skip_multibyte': v:true,
    \ 'min_pattern_length': 5,
    \ })

set number

colorscheme jellybeans

" Completion
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
