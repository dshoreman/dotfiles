" This config is only used by classic Vim.

let NERDTreeIgnore=['^.git$', '^.idea$', '.pyc$', '^.vagrant$']

" Enable bookmarks, but move them out of ~/
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksFile=$HOME."/.vim/bookmarks"

" Useful if I ever :set wildignore
let NERDTreeRespectWildIgnore=1

" Enable single click on directories
let NERDTreeMouseMode=2

" Lifesaver.
let NERDTreeQuitOnOpen=1

" Show dotfiles by default
let NERDTreeShowHidden=1

" Help jumping around long file lists
let NERDTreeShowLineNumbers=1

" Set the width of the NERDTree pane
let NERDTreeWinSize=31

" Fancy arrows instead of | and +
let NERDTreeDirArrows=1

" And finally, map the thing.
map <C-b> :NERDTreeToggle<CR>
