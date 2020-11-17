let s:floating_window_width_ratio = 1.0
let s:floating_window_height_ratio = 0.7

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
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> a
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
  nmap <silent><buffer> q     <Plug>(denite_filter_quit)
  imap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
  nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
endfunction

augroup denite-transparent-windows
  autocmd!
  autocmd FileType denite set winblend=15
  autocmd FileType denite-filter set winblend=15
augroup END

call denite#custom#option('denite-sp', {
\ 'auto_action': 'preview',
\ 'default_action': 'split',
\ 'floating_preview': v:true,
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

call denite#custom#option('denite-vs', {
\ 'auto_action': 'preview',
\ 'default_action': 'vsplit',
\ 'floating_preview': v:true,
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

" Key mappings
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
nmap <silent> ;;g  :<C-u>Denite -buffer-name=denite-sp grep<CR>
nmap <silent> ;;vg :<C-u>Denite -buffer-name=denite-vs grep<CR>
nmap <silent> ;;G  :<C-u>DeniteProjectDir -buffer-name=denite-sp grep<CR>
nmap <silent> ;;vG :<C-u>DeniteProjectDir -buffer-name=denite-vs grep<CR>
