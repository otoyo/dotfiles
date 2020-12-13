let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'ignore_sources': {
\  '_': ['omni'],
\ },
\ 'min_pattern_length': 2,
\ 'skip_multibyte': v:true,
\ })
