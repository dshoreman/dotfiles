let g:startify_bookmarks = [
            \ { 'c': '~/.files/stowable/nvim' },
            \ ]

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

let g:startify_fortune_use_unicode = 1

let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_sort = 1

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions'] },
            \ { 'type': 'files',     'header': ['   Recent Files'] },
            \ { 'type': 'dir',       'header': ['   Recent Files in '. getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
            \ { 'type': 'commands',  'header': ['   Commands'] },
            \ ]

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ '^/tmp',
            \ ]
