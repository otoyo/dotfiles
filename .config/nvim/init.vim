let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'nanotech/jellybeans.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

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
    \ 'ignore_sources': {
    \  '_': ['around'],
    \ },
    \ 'min_pattern_length': 4,
    \ 'skip_multibyte': v:true,
    \ })

" denite
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

" Ripgrep command on grep source
call denite#custom#var('grep', {
			\ 'command': ['rg'],
			\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
			\ 'recursive_opts': [],
			\ 'pattern_opt': ['--regexp'],
			\ 'separator': ['--'],
			\ 'final_opts': [],
			\ })

" ref. https://github.com/Shougo/denite.nvim/issues/657
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

call denite#custom#option('default', {'direction': 'aboveleft'})
nmap <silent> ;f :<C-u>DeniteProjectDir -default-action=split -split=horizontal -winheight=`winheight(0)/2` -start-filter file/rec<CR>
nmap <silent> ;g :<C-u>DeniteCursorWord -default-action=split -split=horizontal -winheight=`winheight(0)/2` grep<CR>
nmap <silent> ;G :<C-u>Denite -default-action=split -split=horizontal -winheight=`winheight(0)/2` grep:::<C-r><C-a><CR>
nmap <silent> ;;g :<C-u>Denite -default-action=split -split=horizontal -winheight=`winheight(0)/2` grep<CR>
nmap <silent> ;vf :<C-u>DeniteProjectDir -default-action=vsplit -split=vertical -start-filter file/rec<CR>
nmap <silent> ;vg :<C-u>DeniteCursorWord -default-action=vsplit -split=vertical grep<CR>
nmap <silent> ;vG :<C-u>Denite -default-action=vsplit -split=vertical grep:::<C-r><C-a><CR>
nmap <silent> ;;vg :<C-u>Denite -default-action=vsplit -split=vertical grep<CR>


set number

colorscheme jellybeans

" Completion
set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
