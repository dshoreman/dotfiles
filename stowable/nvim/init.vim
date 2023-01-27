" General: {
    let mapleader=" "
    source ~/.config/nvim/plugins.vim

    set timeoutlen=400                " Don't delay for so long after <leader>
    set nrformats="alpha,bin,hex"     " Let ^A^X in/decrease binary, hex or single letters
    set wildmode=list:longest,full    " Enhance command-line completion

    " Bindings to make saving easier
    nnoremap <Leader>w :w<CR>
    nnoremap <silent> <Leader>W :w !sudo tee % > /dev/null<CR>:edit!<CR>

    nnoremap <silent> <Leader>bda :bufdo bwipeout<CR><CR>
" }


" UI: {
    set title                         " Display filename in the terminal title
    set number                        " Display line numbers
    set relativenumber                " Show line number relative to current
    set signcolumn=yes                " Don't hide sign column to avoid jumping code
    set showmatch                     " Show matching brackets on insert
    set updatetime=300                " Delay for cursor idle, used for symbol highlight
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
"}


" Formatting: {
    set list                          " Enable listchars
    set listchars=tab:▶▸,trail:·      " Make tabs and trailing spaces visible
    set expandtab                     " Insert spaces instead of tabs
    set tabstop=4                     " Width existing TAB characters are displayed as
    set shiftwidth=4                  " Spaces shifted when using <<, == and >>

    " Emulate "outdenting" shift-tab functionality of other editors
    nmap <S-Tab> <<
    imap <S-Tab> <C-o><<
" }


source ~/.config/nvim/configs/coc.vim
source ~/.config/nvim/configs/airline.vim
source ~/.config/nvim/configs/nvim-tree.lua
source ~/.config/nvim/configs/startify.vim


" Functions: {
    " Relative line numbers (`r)
    fun! NumberToggle(...)
        let hidenums = get(a:, 1, 0)

        if (hidenums == 1)
            if (&number == 1)
                set nornu
                set nonu
            else
                set rnu
                set nu
            endif
        else
            set nu " Numbers should always be shown for rnu, otherwise current line is 0
            if (&relativenumber == 1)
                set nornu
            else
                set rnu
            endif
        endif
    endfun
    nnoremap <Leader>r :call NumberToggle(0)<cr>
    nnoremap <Leader>R :call NumberToggle(1)<cr>

    " Strip trailing whitespace (`ss)
    fun! WhitespaceFixer()
        let l = line('.')
        let c = col('.')
        :%s/\s\+$//e
        call cursor(l, c)
    endfun
    noremap <leader>ss :call WhitespaceFixer()<CR>
" }
