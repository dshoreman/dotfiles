let data_dir = stdpath('data') . '/site'
let mapleader = " "

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/functions.vim

" Shared configs
source ~/.config/nvim/configs/airline.vim
source ~/.config/nvim/configs/colours.vim
source ~/.config/nvim/configs/gutentags.vim
source ~/.config/nvim/configs/import-cost.vim
source ~/.config/nvim/configs/mundo.vim
source ~/.config/nvim/configs/schlepp.vim
source ~/.config/nvim/configs/startify.vim

" Neovim-only configs
source ~/.config/nvim/configs/coc.vim
source ~/.config/nvim/configs/devicons.lua
source ~/.config/nvim/configs/nvim-tree.lua
source ~/.config/nvim/configs/snippets.vim
source ~/.config/nvim/configs/telescope.lua
source ~/.config/nvim/configs/tidy.lua
source ~/.config/nvim/configs/treesitter.lua
source ~/.config/nvim/configs/vista.vim

" Restore cursor position when loading files
" It worked with sessions, but not others.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line('$') |
            \   exe "normal! g`\"" |
            \ endif
