require('nvim-tree').setup({
  disable_netrw = true,
  actions = {
    change_dir = { enable = false },
    expand_all = { exclude = {
      ".git",
      ".idea",
      ".vagrant",
      "node_modules",
      "vendor",
    }},
    open_file = {
      quit_on_open = true,
      window_picker = { enable = false },
    },
  },
  filters = {
    custom = {
      "^.git$",
    },
  },
  renderer = {
      full_name = true,
      group_empty = true,
      highlight_opened_files = 'name',
      highlight_modified = 'name',
  },
  view = {
      relativenumber = true,
      width = 40,
  },
})

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
