let g:Schlepp#allowSquishingLines = 1
let g:Schlepp#allowSquishingBlock = 1

vmap <unique> <up>      <Plug>SchleppUp
vmap <unique> <S-up>    <Plug>SchleppIndentUp
vmap <unique> <down>    <Plug>SchleppDown
vmap <unique> <S-down>  <Plug>SchleppIndentDown
vmap <unique> <left>    <Plug>SchleppLeft
vmap <unique> <right>   <Plug>SchleppRight

vmap <unique> Dk <Plug>SchleppDupUp
vmap <unique> Dj <Plug>SchleppDupDown
vmap <unique> Dh <Plug>SchleppDupLeft
vmap <unique> Dl <Plug>SchleppDupRight
