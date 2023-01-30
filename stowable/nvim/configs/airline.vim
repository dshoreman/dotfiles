" Neodark theme is broken with notermguicolors,
" so neogumbat is a tweaked fork to fix that.
let g:airline_powerline_fonts = 1
let g:airline_theme = 'neogumbat'

" Potentially fix lag issues in JS/vue files
let g:airline_highlighting_cache = 1

" Enable tabline along the top, and base numbers on tabs not splits
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" Enable CoC diagnostics support
let g:airline#extensions#coc#error_symbol =  '✘ '

" And finally, add a section to the left showing Git hunks
let g:airline_section_b = airline#section#create_left(['hunks'])
