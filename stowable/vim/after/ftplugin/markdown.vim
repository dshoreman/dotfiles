" Markdown Preview: {
    let b:mkdp_page_title = '${name} Preview'           " Page <title> for preview tab
    let b:mkdp_auto_close = 0                           " Disable automatic close when switching buffers
    let b:mkdp_markdown_css = '/home/dshoreman/.vim/markdown-preview.css'

    nmap <Leader>mp :MarkdownPreview<CR>
    nmap <Leader>mps :MarkdownPreviewStop<CR>
" }
