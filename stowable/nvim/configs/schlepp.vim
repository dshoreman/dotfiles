let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1
let g:Schlepp#trimWS = 0

if !exists('g:mappedSchleppKeys')
    vmap <unique> <A-k>   <Plug>SchleppIndentUp
    vmap <unique> <A-j>   <Plug>SchleppIndentDown
    vmap <unique> <A-h>   <Plug>SchleppLeft
    vmap <unique> <A-l>   <Plug>SchleppRight
    vmap <unique> <A-S-k> <Plug>SchleppUp
    vmap <unique> <A-S-j> <Plug>SchleppDown

    vmap <unique> Dk <Plug>SchleppDupUp
    vmap <unique> Dj <Plug>SchleppDupDown
    vmap <unique> Dh <Plug>SchleppDupLeft
    vmap <unique> Dl <Plug>SchleppDupRight

    let g:mappedSchleppKeys = 1
endif
