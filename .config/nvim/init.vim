let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'nanotech/jellybeans.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim', { 'do': ':UpdateRemotePlugins' }

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

" denite
nmap <silent> ,f :<C-u>Denite -direction=topleft -split=vertical -start-filter file/rec<CR>
nmap <silent> ,g :<C-u>Denite -direction=topleft -split=vertical grep<CR>
nmap <silent> ,r :<C-u>Denite -direction=topleft -split=vertical file_mru<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

call denite#custom#kind('file', 'default_action', 'vsplit')


set number

colorscheme jellybeans

" Completion
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
