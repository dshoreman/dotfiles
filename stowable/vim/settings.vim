" This file contains only vim-specific options, many
" of which already have sensible defaults in nvim.
source ~/.config/nvim/settings.vim

" General: {
    syntax on                         " Enable syntax highlighting
    filetype plugin indent on         " Automatically detect file types

    set background=dark               " Set colours according to dark background
    set backspace=indent,eol,start    " Backspace over everything in insert mode
    set history=10000                 " Number of lines in command history
    set ttimeoutlen=50                " Fix lag when leaving insert mode
    set wildmenu                      " Enhance command-line completion
" }


" UI: {
    set ruler                         " Display cursor position
    set showcmd                       " Display command or visual selection info
    set laststatus=2                  " Always show the status line
" }


" Encoding: {
    set encoding=utf-8 nobomb         " Make sure display encoding is Unicode
    set fileencoding=utf-8            " Convert non-unicode files to UTF-8 on save
" }


" Search: {
    set hlsearch                      " Highlight search results
    set incsearch                     " Jump to result mid-search

    " Set :grep command to use The Silver Searcher
    set grepprg="ag --nogroup --nocolor"
"}


" Backups: {
    set nobackup                      " Disable creation of backup files
    set directory=~/.vim/swap//       " Place swapfiles away from projects
                                      "  ...but include full paths in the filenames (//)
    set undodir=~/.vim/undo//         " Same for persistent undo files

    set viminfo=!,'1000,s100,h,n~/.cache/vim/viminfo    " Store viminfo for
                                      " 1000 files, with no more than 100kB
                                      " of data per register. Other settings
                                      " make use of the `history` option.
                                      " File path set in .cache/vim to avoid
                                      " polluting the home directory.
" }


" Formatting: {
    set autoindent                    " Fallback to basic indents when filetype fails
    set nojoinspaces                  " Only insert one space when joining lines
    set formatoptions+=or             " Automatically add comment marker on next line
    set formatoptions+=j              " Automatically remove comment marker on line merge
" }
