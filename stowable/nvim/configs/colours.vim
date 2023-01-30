let g:neodark#terminal_transparent = 1
let g:neodark#solid_vertsplit = 1
let g:neodark#italics = 1

set termguicolors
colorscheme neodark

" Fix for getting transparent background in terminal.
" While there's an option, it doesn't seem to work.
hi! Normal ctermbg=NONE guibg=NONE

nnoremap <Leader>clc :call CocAction('pickColor')<CR>
nnoremap <Leader>clp :call CocAction('colorPresentation')<CR>
