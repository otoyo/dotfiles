let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'ignore_sources': {
\  '_': ['omni'],
\ },
\ 'min_pattern_length': 2,
\ 'skip_multibyte': v:true,
\ })
