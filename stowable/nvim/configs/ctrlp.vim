" This config is only used by classic Vim.

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --follow --hidden --column --line-number --no-heading --smart-case -li ""'

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
