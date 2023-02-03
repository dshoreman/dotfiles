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

if !has('nvim')
    " Strip trailing whitespace (`ss)
    fun! WhitespaceFixer()
        let l = line('.')
        let c = col('.')
        :%s/\s\+$//e
        call cursor(l, c)
    endfun
    noremap <leader>ss :call WhitespaceFixer()<CR>
endif
