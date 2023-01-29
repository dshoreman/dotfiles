setlocal tabstop=2
setlocal shiftwidth=2

nmap <buffer> <Leader>mp :CocCommand markdown-preview-enhanced.openPreview<CR>

nmap <buffer> <Leader>mpm <Plug>(coc-markmap-create)
vmap <buffer> <Leader>mpm <Plug>(coc-markmap-create-v)
nmap <buffer> <Leader>mpw :CocCommand markmap.watch<CR>
