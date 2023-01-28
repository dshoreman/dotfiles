call plug#begin()

    " Theme
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'dshoreman/neogumbat.vim'

    " UI / Navigation
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/vim-peekaboo'
    Plug 'mhinz/vim-startify'
    Plug 'nvim-lua/plenary.nvim' |
                \ Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.*' }
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'liuchengxu/vista.vim'

    " Snippets / Code Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Extra Syntaxes
    Plug 'sheerun/vim-polyglot'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'Firef0x/PKGBUILD.vim'

    " Language Tooling
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*',
                \'do': 'composer install --no-dev -o'}

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
