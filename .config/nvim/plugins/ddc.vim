" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', ['around', 'nvim-lsp'])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_fuzzy'],
      \   'sorters': ['sorter_fuzzy'],
      \   'converters': ['converter_fuzzy'],
      \ },
      \ 'around': {'mark': 'A'},
      \ 'nvim-lsp': {
      \   'mark': 'L',
      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'},
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
      \ })


call ddc#custom#patch_global('completionMenu', 'pum.vim')

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#manual_complete()
inoremap <S-Tab>  <Cmd>call pum#map#insert_relative(-1)<CR>
imap <silent><expr> <Down>
      \ pum#visible() ? '<Cmd>call pum#map#select_relative(+1)<CR>' :
      \ '<Down>'
imap <silent><expr><Up>
      \ pum#visible() ? '<Cmd>call pum#map#select_relative(-1)<CR>' :
      \ '<Up>'
imap <silent><expr> <CR>
      \ pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' :
      \ '<CR>'

" Use ddc.
call ddc#enable()
