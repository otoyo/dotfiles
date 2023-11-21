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
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

inoremap <silent><expr> <Enter>
\ pumvisible() ? '<C-y>' : '<Enter>'

imap <silent><expr> <Down>
\ pumvisible() ? '<C-n>' : '<Down>'

imap <silent><expr> <Up>
\ pumvisible() ? '<C-p>' : '<Up>'

" Use ddc.
call ddc#enable()
