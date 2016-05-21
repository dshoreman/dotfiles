call plug#begin('~/.vim/plugged')

    Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/syntastic'
    Plug 'vim-airline/vim-airline'

call plug#end()


" Plug Bindings: {
    nmap <Leader>pi :PlugInstall<CR>
    nmap <Leader>pu :PlugUpdate<CR>
    nmap <Leader>pU :PlugUpgrade<CR>
" }


" Airline: {
    let g:airline_powerline_fonts = 1                   " Tell airline we want more awesome
    let g:airline_Theme = 'powerlineish'                " Set the theme... duh
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


" NERDTree: {
    let NERDTreeIgnore=['^.git$', '^.idea$']            " Ignore .git, but not .gitignore!
    let NERDTreeBookmarksFile=$HOME."/.vim/bookmarks"   " Move bookmarks out of ~/
                                                        " If the above doesn't work: $HOME."/..."
    let NERDTreeRespectWildIgnore=1                     " Useful if I ever :set wildignore
    let NERDTreeMouseMode=2                             " Enable single click on directories
    let NERDTreeQuitOnOpen=1                            " Lifesaver.
    let NERDTreeShowBookmarks=1                         " Might encourage me to bookmark things
    let NERDTreeShowHidden=1                            " Show dotfiles by default
    let NERDTreeShowLineNumbers=1                       " Help jumping around long file lists
    let NERDTreeWinSize=31                              " Set the width of the NERDTree pane
    let NERDTreeMinimalUI=1                             " Remove 'Press ? for Help' garbage
    let NERDTreeDirArrows=1                             " Fancy arrows instead of | and +
    map <C-b> :NERDTreeToggle<CR>
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
    let g:syntastic_warning_symbol = "⚠"                " Display a fancy UTF-8 warning sign
" }