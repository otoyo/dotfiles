let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'ignore_sources': {
\  '_': ['omni'],
\ },
\ 'min_pattern_length': 2,
\ 'skip_multibyte': v:true,
\ })
