let g:neodark#terminal_transparent = 1
let g:neodark#solid_cursorline = 0
let g:neodark#italics = 1
if !has('nvim')
    let g:neodark#solid_vertsplit = 1
endif

set termguicolors
colorscheme neodark

nnoremap <Leader>clc :call CocAction('pickColor')<CR>
nnoremap <Leader>clp :call CocAction('colorPresentation')<CR>
