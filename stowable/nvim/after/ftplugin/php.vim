" Fix duplicate $ when completing variables
setlocal iskeyword+=$

" Phpactor: {
    " Include use statement
    nmap <Leader>u :call phpactor#UseAdd()<CR>

    " Invoke the context menu
    nmap <Leader>mm :call phpactor#ContextMenu()<CR>

    " Invoke the navigation menu
    nmap <Leader>nn :call phpactor#Navigate()<CR>

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
