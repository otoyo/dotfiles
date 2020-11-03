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

" Change file/rec command
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Ripgrep command on grep source
call denite#custom#var('grep', {
\ 'command': ['rg'],
\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
\ 'recursive_opts': [],
\ 'pattern_opt': ['--regexp'],
\ 'separator': ['--'],
\ 'final_opts': [],
\ })

" Disable auto_complete in denite-filter
" ref. https://github.com/Shougo/denite.nvim/issues/657
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

augroup denite-transparent-windows
  autocmd!
  autocmd FileType denite set winblend=15
  autocmd FileType denite-filter set winblend=15
augroup END

call denite#custom#option('denite-sp', {
\ 'default_action': 'split',
\ 'direction': 'aboveleft',
\ 'split': 'horizontal',
\ 'winheight': winheight(0)/2,
\ })

call denite#custom#option('denite-vs', {
\ 'default_action': 'vsplit',
\ 'direction': 'aboveleft',
\ 'split': 'vertical',
\ })
