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
    Plug 'tpope/vim-unimpaired'
    if has('nvim')
        Plug 'nvim-lua/plenary.nvim' |
                    \ Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.*' }
        Plug 'nvim-tree/nvim-web-devicons' |
                    \ Plug 'nvim-tree/nvim-tree.lua'
        Plug 'liuchengxu/vista.vim'
    else
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-gitgutter'
        Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'tpope/vim-obsession'
        Plug 'majutsushi/tagbar'
        Plug 'markonm/traces.vim'
    endif

    " File/Code Manipulation
    Plug 'jiangmiao/auto-pairs'
    Plug 'Shougo/context_filetype.vim' |
                \ Plug 'tyru/caw.vim'
    Plug 'tpope/vim-eunuch'
    Plug 'simnalamburt/vim-mundo'
    Plug 'zirrostig/vim-schlepp'
    Plug 'mcauley-penney/tidy.nvim'

    " Snippets / Code Completion
    if has('nvim')
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    else
        Plug 'roxma/vim-hug-neovim-rpc' | Plug 'roxma/nvim-yarp' |
                    \ Plug 'ncm2/ncm2'
        Plug 'ncm2/ncm2-bufword'
        Plug 'fgrsnau/ncm2-otherbuf', {'branch': 'master'}
        Plug 'ncm2/ncm2-html-subscope'
        Plug 'ncm2/ncm2-markdown-subscope', {'for': 'markdown'}
        Plug 'ncm2/ncm2-path'
        Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
        Plug 'ncm2/ncm2-ultisnips'
    endif
    Plug 'SirVer/ultisnips'

    " Extra Syntaxes
    Plug 'sheerun/vim-polyglot'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'Firef0x/PKGBUILD.vim'
    if !has('nvim')
        Plug 'w0rp/ale'
        Plug 'othree/html5.vim'
        Plug 'StanAngeloff/php.vim'
        Plug 'posva/vim-vue'
    endif

    " Language Tooling
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*',
                \'do': 'composer install --no-dev -o'}
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
    if !has('nvim')
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    endif

call plug#end()


" Plug Bindings: {
    nmap <Leader>pi :PlugInstall<CR>
    nmap <Leader>pu :PlugUpdate<CR>
    nmap <Leader>pU :PlugUpgrade<CR>
    nmap <Leader>pc :PlugClean<CR>
    nmap <Leader>pC :PlugClean!<CR>
" }
