call plug#begin()

    " Theme
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'dshoreman/neogumbat.vim'

    " UI / Navigation
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'lambdalisue/gina.vim'
    Plug 'junegunn/vim-peekaboo'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-surround'
    Plug 'nvim-lua/plenary.nvim' |
                \ Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.*' }
    Plug 'nvim-tree/nvim-web-devicons' |
                \ Plug 'nvim-tree/nvim-tree.lua'
    Plug 'tpope/vim-unimpaired'
    Plug 'liuchengxu/vista.vim'

    " File/Code Manipulation
    Plug 'jiangmiao/auto-pairs'
    Plug 'Shougo/context_filetype.vim' |
                \ Plug 'tyru/caw.vim'
    Plug 'tpope/vim-eunuch'
    Plug 'simnalamburt/vim-mundo'
    Plug 'zirrostig/vim-schlepp'

    " Snippets / Code Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'SirVer/ultisnips'

    " Extra Syntaxes
    Plug 'sheerun/vim-polyglot'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'Firef0x/PKGBUILD.vim'

    " Language Tooling
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*',
                \'do': 'composer install --no-dev -o'}
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

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
