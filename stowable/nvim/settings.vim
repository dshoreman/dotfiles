" General: {
    set timeoutlen=400                " Increase allowed time for mapped sequences
    set nrformats="alpha,bin,hex"     " Let ^A^X in/decrease binary, hex or single letters
    set wildmode=list:longest,full    " List matches, complete longest common string

    " Bindings to make saving easier
    nnoremap <Leader>w :w<CR>
    nnoremap <silent> <Leader>W :w !sudo tee % > /dev/null<CR>:edit!<CR>

    nnoremap <silent> <Leader>bd :bd<CR>
    nnoremap <silent> <Leader>bda :bufdo bwipeout<CR><CR>
" }


" Clipboard: {
    " Paste over visual selection without losing paste buffer
    xmap <Leader>p "_dP

    " Yank (or delete) into the system clipboard
    nmap <Leader>y "+y
    vmap <Leader>y "+y
    nmap <Leader>Y "+Y
    nmap <Leader>d "+d
    vmap <Leader>d "+d
" }


" Navigation: {
    " Keep cursor centred when scrolling half-pages
    nmap <C-d> <C-d>zz
    nmap <C-u> <C-u>zz

    " Same but for jumping between matches, with auto-unfold
    nmap n nzzzv
    nmap N Nzzzv

    " Switch between windows without <C-w>
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
" }


" UI: {
    set title                         " Display filename in the terminal title
    set number                        " Display line numbers
    set relativenumber                " Show line number relative to current
    set showmatch                     " Show matching brackets on insert
    if has('nvim')
        set signcolumn=yes            " Don't hide sign column to avoid jumping code
        set inccommand=split          " Preview :substitute results in a split
    endif
    set updatetime=50                 " Delay for cursor idle, used for symbol highlight
    set cursorline                    " Highlight current line
    set noshowmode                    " Don't show default mode indicator
    set noequalalways                 " Prevent automatic resize of split windows
    set splitbelow                    " Open new split below, not above
    set splitright                    " Open new vsplit to the right
    set scrolloff=10                  " Start scroll 10 lines away from top/bottom
" }


" Search: {
    set ignorecase                    " Make searching case insensitive
    set smartcase                     " ...unless the query has capital letters

    " Make space clear highlighted search terms when pressed
    nnoremap <silent> <Leader><BS> :nohlsearch<Bar>:echo<CR>
"}


" Backups: {
    set undofile                      " Enable persistent undo files
" }


" Formatting: {
    set list                          " Enable listchars
    set listchars=tab:▶▸,trail:·      " Make tabs and trailing spaces visible
    set expandtab                     " Insert spaces instead of tabs
    set tabstop=4                     " Width existing TAB characters are displayed as
    set shiftwidth=4                  " Spaces shifted when using << and >>
" }
