" Hit K for PHP docs. Run `sync-pman` in shell to update
setlocal keywordprg=:terminal\ ++close\ pman

" Same thing but bound with ctrl to open in vsplit
nmap <C-S-k> :vert terminal ++close pman <cword><CR>

" ALE: {
    let b:ale_fixers = ['php_cs_fixer']
    let g:ale_php_cs_fixer_options = '--config=build/php-cs-fixer/config.php'
    let g:ale_php_phpcs_standard = 'PSR12'
    let g:ale_php_phpmd_ruleset = 'build/phpmd/rules.xml'
    let g:ale_php_phpstan_configuration = 'build/phpstan/config.neon'
    call ale#Set('psalm_langserver_options', '-c build/psalm/psalm.xml')
" }

" PHPactor: {
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
    inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
    noremap <Leader>s :call PhpSortUse()<CR>
" }
