call plug#begin('~/.vim/plugged')
    " Theme
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'dshoreman/neogumbat.vim'

    " UI
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'simnalamburt/vim-mundo'
    Plug 'junegunn/vim-peekaboo'
    Plug 'mhinz/vim-startify'
    Plug 'majutsushi/tagbar'

    " Navigation
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'zirrostig/vim-schlepp'

    " Misc
    Plug 'markonm/traces.vim'
    Plug 'Shougo/context_filetype.vim'
    Plug 'tyru/caw.vim'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-surround'

    " Git / Merging
    Plug 'tpope/vim-fugitive'
    Plug 'lambdalisue/gina.vim'
    Plug 'sjl/splice.vim'

    " Snippets / Code Completion
    Plug 'SirVer/ultisnips'
    Plug 'ncm2/ncm2'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
    Plug 'pbogut/ncm2-alchemist', {'for': 'elixir'}
    Plug 'ncm2/ncm2-bufword'
    Plug 'fgrsnau/ncm2-otherbuf'
    Plug 'ncm2/ncm2-html-subscope'
    Plug 'ncm2/ncm2-markdown-subscope', {'for': 'markdown'}
    Plug 'ncm2/ncm2-path'
    Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
    Plug 'ncm2/ncm2-ultisnips'

    " General Language Support
    Plug 'w0rp/ale'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'sheerun/vim-polyglot'

    " Specific Languages
    Plug 'othree/html5.vim'
    Plug 'mattn/emmet-vim'

    " Elixir
    Plug 'elixir-lsp/elixir-ls', { 'tag': 'v0.7.0', 'do': 'mkdir -p rel; mix deps.get && mix compile; mix elixir_ls.release -o rel' }
    Plug 'slashmili/alchemist.vim'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " i3[-gaps] Config
    Plug 'PotatoesMaster/i3-vim-syntax'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " PHP
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'phpactor/phpactor', { 'for': 'php', 'branch': 'develop', 'do': 'composer install --no-dev -o' }
    Plug 'StanAngeloff/php.vim'

    " Vue/JS
    Plug 'posva/vim-vue'
    Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

call plug#end()


" Colour Scheme: {
    let g:neodark#terminal_transparent = 1
    let g:neodark#solid_vertsplit = 1
    colorscheme neodark
" }


" Plug Bindings: {
    nmap <Leader>pi :PlugInstall<CR>
    nmap <Leader>pu :PlugUpdate<CR>
    nmap <Leader>pU :PlugUpgrade<CR>
    nmap <Leader>pc :PlugClean<CR>
    nmap <Leader>pC :PlugClean!<CR>
" }


" ALE: {
    let g:ale_completion_enabled = 1
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
                \   '*': ['remove_trailing_lines'],
                \ }
" }


" Airline: {
    let g:airline_theme = 'neogumbat'                   " Neodark theme is broken with notermguicolors
    let g:airline_powerline_fonts = 1                   " Tell airline we want more awesome
    let g:airline#extensions#tabline#enabled = 1        " Enable tabline along the top
    let g:airline#extensions#tabline#tab_nr_type = 1    " Base numbers on tab num, not num splits
" }


" CtrlP: {
    if executable('rg')
        let $FZF_DEFAULT_COMMAND = 'rg --follow --hidden --no-ignore-vcs -li ""'
        command! -bang -nargs=* Rg
                    \ call fzf#vim#grep(
                    \   'rg --column --line-number --no-heading '
                    \   .'--color=always --smart-case --follow --hidden -- '
                    \   .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
        nnoremap <C-g> :Rg<CR>
    elseif executable('ag')
        let $FZF_DEFAULT_COMMAND = 'ag --hidden --skip-vcs-ignores -lg ""'
    endif

    nnoremap <C-p> :Files<CR>
" }


" GutenTags: {
    let g:gutentags_cache_dir = '~/.cache/vim/tags'    " Keep tags files out of project directories
" }


" Import Cost: {
    nmap <Leader>ic :ImportCost<CR>
" }


" Mundo: {
    nnoremap <Leader>uu :MundoToggle<CR>
" }


" NCM2: {
    autocmd BufEnter * call ncm2#enable_for_buffer()

    set completeopt=noinsert,menuone,noselect
    inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" }


" NERDTree: {
    let NERDTreeIgnore=['^.git$', '^.idea$', '.pyc$', '^.vagrant$']
    let NERDTreeBookmarksFile=$HOME."/.vim/bookmarks"   " Move bookmarks out of ~/
                                                        " If the above doesn't work: $HOME."/..."
    let NERDTreeRespectWildIgnore=1                     " Useful if I ever :set wildignore
    let NERDTreeMouseMode=2                             " Enable single click on directories
    let NERDTreeQuitOnOpen=1                            " Lifesaver.
    let NERDTreeShowBookmarks=1                         " Might encourage me to bookmark things
    let NERDTreeShowHidden=1                            " Show dotfiles by default
    let NERDTreeShowLineNumbers=1                       " Help jumping around long file lists
    let NERDTreeWinSize=31                              " Set the width of the NERDTree pane
    let NERDTreeDirArrows=1                             " Fancy arrows instead of | and +
    map <C-b> :NERDTreeToggle<CR>
" }


" PHPactor: {
    " let g:phpactorBranch = 'develop'                    " Used by phpactor#Update()
" }


" Schlepp: {
    vmap <unique> <up>      <Plug>SchleppUp
    vmap <unique> <S-up>    <Plug>SchleppIndentUp
    vmap <unique> <down>    <Plug>SchleppDown
    vmap <unique> <S-down>  <Plug>SchleppIndentDown
    vmap <unique> <left>    <Plug>SchleppLeft
    vmap <unique> <right>   <Plug>SchleppRight

    vmap <unique> Dk <Plug>SchleppDupUp
    vmap <unique> Dj <Plug>SchleppDupDown
    vmap <unique> Dh <Plug>SchleppDupLeft
    vmap <unique> Dl <Plug>SchleppDupRight
" }


" TagBar: {
    let g:tagbar_autoclose = 1                          " Close tagbar when jumping to tag
    let g:tagbar_autopreview = 1                        " Jump to tag when moving cursor in tagbar
    let g:tagbar_show_linenumbers = -1                  " Use global line number settings
    nmap <Leader>tb :TagbarToggle<CR>
" }

" UltiSnips: {
    let g:UltiSnipsExpandTrigger="<tab>"
" }
