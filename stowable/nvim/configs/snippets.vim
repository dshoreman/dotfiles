if has('nvim')
    " Set a fake key to stop it clashing with coc
    let g:UltiSnipsExpandTrigger = '<f13>'
else
    let g:UltiSnipsExpandTrigger="<tab>"
endif
