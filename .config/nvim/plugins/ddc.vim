" Customize global settings

" You must set the default ui.
" NOTE: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

" Use around source.
" https://github.com/Shougo/ddc-source-around
call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', #{
\   _: #{
\     matchers: ['matcher_fuzzy'],
\     sorters: ['sorter_fuzzy'],
\     converters: ['converter_fuzzy'],
\   },
\ })

" Change source options
call ddc#custom#patch_global('sourceOptions', #{
\   around: #{ mark: 'A' },
\ })
call ddc#custom#patch_global('sourceParams', #{
\   around: #{ maxSize: 500 },
\ })

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
