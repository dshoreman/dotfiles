require('nvim-treesitter.configs').setup{
  ensure_installed = {
    'bash', 'lua', 'vim', 'help', 'markdown', 'json', 'jsonc',
    'html', 'make', 'php', 'javascript', 'typescript', 'vue',
  },
  auto_install = true,
  sync_install = true,
  indent = { enable = true },
  highlight = { enable = true },
  additional_vim_regex_highlighting = false,
}
