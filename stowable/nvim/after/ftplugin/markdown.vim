setlocal tabstop=2
setlocal shiftwidth=2

if has('nvim')
    nmap <buffer> <Leader>mp :CocCommand markdown-preview-enhanced.openPreview<CR>

    nmap <buffer> <Leader>mpm <Plug>(coc-markmap-create)
    vmap <buffer> <Leader>mpm <Plug>(coc-markmap-create-v)
    nmap <buffer> <Leader>mpw :CocCommand markmap.watch<CR>
else
    let g:mkdp_markdown_css = '/home/dshoreman/.vim/markdown-preview.css'
    let g:mkdp_page_title = '${name} Preview'
    let g:mkdp_auto_close = 0

    nmap <Leader>mp :MarkdownPreview<CR>
    nmap <Leader>mps :MarkdownPreviewStop<CR>
endif
