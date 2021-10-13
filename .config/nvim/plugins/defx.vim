call defx#custom#option('_', {
\ 'winwidth': 40,
\ 'split': 'vertical',
\ 'direction': 'topleft',
\ 'show_ignored_files': 1,
\ 'toggle': 1,
\ 'resume': 1,
\ })

" Nerd Fonts
call defx#custom#column('icon', {
\ 'directory_icon': ' ',
\ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  execute 'DisableWhitespace'

  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ? defx#do_action('open') :
  \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> <Esc>
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> ..
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> mv
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> mk
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
endfunction
