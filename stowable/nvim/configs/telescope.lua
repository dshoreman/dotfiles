local telescope, builtin = require('telescope'), require('telescope.builtin')

function rgCmd(opts)
  local cmd = {
    'rg', '-L', '--color', 'never', '--smart-case', '--hidden', '--glob', '!**/.git/*'
  }
  for _, opt in ipairs(opts) do
    table.insert(cmd, '--' .. opt)
  end
  return cmd
end

telescope.setup{
  defaults = {
    dynamic_preview_title = true,
    vimgrep_arguments = rgCmd({
      'no-heading', 'with-filename', 'column', 'line-number'
    }),
  },
  pickers = {
    find_files = {
      find_command = rgCmd({'files', 'no-ignore-vcs'}),
    }
  },
}

telescope.load_extension('fzf')

function fuzzyFindFiles()
  builtin.grep_string({
    prompt_title = 'Live Grep',
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
  })
end

vim.keymap.set('n', '<C-g>', '<cmd>lua fuzzyFindFiles{}<cr>', {})
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files path_display={"smart"}<cr>', {})
vim.keymap.set('n', '<C-S-p>', '<cmd>Telescope commands<cr>', {})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
