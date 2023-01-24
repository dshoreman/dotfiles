call plug#begin()

    " Theme
    Plug 'KeitaNakamura/neodark.vim'

call plug#end()


" Colour Scheme: {
    let g:neodark#terminal_transparent = 1
    let g:neodark#solid_vertsplit = 1
    let g:neodark#italics = 1
    colorscheme neodark
" }


" Plug Bindings: {
    nmap <Leader>pi :PlugInstall<CR>
    nmap <Leader>pu :PlugUpdate<CR>
    nmap <Leader>pU :PlugUpgrade<CR>
    nmap <Leader>pc :PlugClean<CR>
    nmap <Leader>pC :PlugClean!<CR>
" }
