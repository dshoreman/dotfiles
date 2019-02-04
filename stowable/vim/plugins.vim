call plug#begin('~/.vim/plugged')

    Plug 'airblade/vim-gitgutter'
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'junegunn/vim-peekaboo'
    Plug 'mattn/emmet-vim'
    Plug 'mhinz/vim-startify'
    Plug 'othree/html5.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/syntastic'
    Plug 'sheerun/vim-polyglot'
    Plug 'simnalamburt/vim-mundo'
    Plug 'sjl/splice.vim'
    Plug 'StanAngeloff/php.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'zirrostig/vim-schlepp'

    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
    Plug 'phpactor/phpactor', { 'for': 'php', 'branch': 'develop', 'do': 'composer install' }
    Plug 'kristijanhusak/deoplete-phpactor'

call plug#end()

" Deoplete: {
    let g:deoplete#enable_at_startup = 1
" }


" Plug Bindings: {
    nmap <Leader>pi :PlugInstall<CR>
    nmap <Leader>pu :PlugUpdate<CR>
    nmap <Leader>pU :PlugUpgrade<CR>
    nmap <Leader>pc :PlugClean<CR>
    nmap <Leader>pC :PlugClean!<CR>
" }


" Airline: {
    let g:airline_powerline_fonts = 1                   " Tell airline we want more awesome
    let g:airline_theme = 'powerlineish'                " Set the theme... duh
    let g:airline#extensions#tabline#enabled = 1        " Enable tabline along the top
    let g:airline#extensions#tabline#tab_nr_type = 1    " Base numbers on tab num, not num splits
" }


" CtrlP: {
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|idea)$'   " Ignore .git and .idea directories
    let g:ctrlp_match_func = {
                \ 'match': 'pymatcher#PyMatch' }        " Set matching function to pymatcher
    let g:ctrlp_user_command = 'ag %s -l                " Use the silver searcher to index
                \ --nocolor                             " ...but strip colour,
                \ --nogroup                             " ...remove headings and blank lines,
                \ --hidden                              " ...include hidden files,
                \ -g ""'                                " ...and finally run the search
" }


" Mundo: {
    nnoremap <Leader>uu :MundoToggle<CR>
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
    let g:phpactorBranch = 'develop'                    " Used by phpactor#Update()

    " Include use statement
    nmap <Leader>u :call phpactor#UseAdd()<CR>

    " Invoke the context menu
    nmap <Leader>mm :call phpactor#ContextMenu()<CR>

    " Invoke the navigation menu
    nmap <Leader>nn :call phpactor#Navigate()<CR>

    " Goto definition of class or class member under the cursor
    nmap <Leader>o :call phpactor#GotoDefinition()<CR>

    " Show brief information about the symbol under the cursor
    nmap <Leader>K :call phpactor#Hover()<CR>

    " Transform the classes in the current file
    " Can be used to complete constructors, implement interface methods, etc
    nmap <Leader>tt :call phpactor#Transform()<CR>

    " Generate a new class (replacing the current file)
    nmap <Leader>cc :call phpactor#ClassNew()<CR>

    " Expand class under cursor to fully qualified name
    nmap <Leader>ec :call phpactor#ClassExpand()<CR>

    " Extract expression (normal mode)
    nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

    " Extract expression from selection
    vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

    " Extract method from selection
    vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" }


" PHP Namespace: {
    " Sort use statements alphabetically
    autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
    autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
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


" Syntastic: {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1        " Always dump errors into location list
    let g:syntastic_auto_loc_list = 1                   " Open list for errors, close when cleared
    let g:syntastic_check_on_open = 1                   " Check syntax when opening files
    let g:syntastic_check_on_wq = 0                     " ...but don't check when closing
    let g:syntastic_error_symbol = "✗"                  " Display a fancy UTF-8 cross
    let g:syntastic_python_checkers = ['python2']
    let g:syntastic_warning_symbol = "⚠"                " Display a fancy UTF-8 warning sign
" }
