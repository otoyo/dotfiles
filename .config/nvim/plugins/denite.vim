let s:floating_window_width_ratio = 1.0
let s:floating_window_height_ratio = 0.7

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> a
  \ denite#do_map('open_filter_buffer')
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

call denite#custom#alias('source', 'grep/ignore_test', 'grep')
call denite#custom#var('grep/ignore_test', {
\ 'command': ['rg'],
\ 'default_opts': ['-i', '--vimgrep', '--no-heading', '-g', '!test/', '-g', '!spec/', '-g', '!*_test.go'],
\ 'recursive_opts': [],
\ 'pattern_opt': ['--regexp'],
\ 'separator': ['--'],
\ 'final_opts': [],
\ })

" Disable auto_complete in denite-filter
" ref. https://github.com/Shougo/denite.nvim/issues/657
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  nmap <silent><buffer> q     <Plug>(denite_filter_quit)
  imap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
  nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
endfunction

augroup denite-transparent-windows
  autocmd!
  autocmd FileType denite set winblend=15
  autocmd FileType denite-filter set winblend=15
augroup END

call denite#custom#option('default', {
\ 'auto_action': 'preview',
\ 'floating_preview': v:true,
\ 'match_highlight': v:true,
\ 'preview_height': float2nr(&lines * s:floating_window_height_ratio),
\ 'preview_width': float2nr(&columns * s:floating_window_width_ratio / 2),
\ 'prompt': '% ',
\ 'split': 'floating',
\ 'vertical_preview': v:true,
\ 'wincol': float2nr((&columns - (&columns * s:floating_window_width_ratio)) / 2),
\ 'winheight': float2nr(&lines * s:floating_window_height_ratio),
\ 'winrow': float2nr((&lines - (&lines * s:floating_window_height_ratio)) / 2),
\ 'winwidth': float2nr(&columns * s:floating_window_width_ratio / 2),
\ })
