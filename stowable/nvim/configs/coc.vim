let g:coc_global_extensions = [
      \ 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-markmap', 'coc-webview',
      \ 'coc-git', 'coc-json', '@yaegassy/coc-nginx', 'coc-sh', 'coc-vimlsp', 'coc-yaml',
      \ 'coc-blade', 'coc-html', 'coc-htmlhint', 'coc-css', 'coc-html-css-support',
      \ 'coc-phpactor', 'coc-php-cs-fixer', 'coc-psalm', '@yaegassy/coc-phpstan',
      \ 'coc-browser', 'coc-discord-rpc', 'coc-emoji',
      \ 'coc-lightbulb', 'coc-snippets', 'coc-tag',
      \ 'coc-eslint', 'coc-tsserver',
      \ 'coc-elixir', 'coc-go',
      \ ]

" Code Completion Menu: {
    " Select with <Tab>, or open menu if cursor isn't after a space
    imap <silent><expr> <Tab>
          \ coc#pum#visible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ?
          \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()

    " Confirm selected item on enter
    inoremap <silent><expr> <CR>
                \ coc#pum#visible() && coc#pum#info()['index'] != -1 ?
                \ coc#pum#confirm() : "\<C-g>u\<CR>"
" }

" Code Navigation: {
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
" }

" Code Actions: {
    " List actions available in current buffer
    nmap <leader>ca  <Plug>(coc-codeaction)

    " Apply code action to selected block
    " e.g. `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Apply at cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Apply to whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)

    " Select AST-based ranges
    nmap <silent><leader>sr <Plug>(coc-range-select)
    xmap <silent><leader>sr <Plug>(coc-range-select)

    " Format selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " Sort import / use statements
    nmap <leader>s :SortUse<CR>

    " Quickfix/codelens current line
    nmap <leader>qf  <Plug>(coc-fix-current)
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Refactoring
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    nmap <leader>rn <Plug>(coc-rename)
" }

" Symbol Hover: {
    " Highlight symbol and references when idle for `updatetime`
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Activate with K
    nnoremap <silent> K :call ShowDocumentation()<CR>

    " Scroll floating window with Ctrl-f/b
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif
" }

" Useful Command Aliases: {
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
    command! -nargs=0 Format :call CocActionAsync('format')
    command! -nargs=0 SortUse :call CocActionAsync('runCommand', 'editor.action.organizeImport')
" }

" Supporting Bits: {
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Map function and class text objects from LS (requires `textDocument.documentSymbol`)
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
" }
