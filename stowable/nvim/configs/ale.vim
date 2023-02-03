" This config is only used by classic Vim.

let g:ale_completion_enabled = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines'],
            \ }

let g:ale_javascript_eslint_options = '-c build/eslint/config.json'
