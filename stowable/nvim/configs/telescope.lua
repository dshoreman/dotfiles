local telescope, builtin = require('telescope'), require('telescope.builtin')
local maxPreviewSize, previewers = 2048, require('telescope.previewers')
local escToClose = {i = {["<Esc>"] = "close"}}

local previewer = function(filepath, buffer, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if stat and stat.size < (maxPreviewSize * 1024) then
      previewers.buffer_previewer_maker(filepath, buffer, opts)
    end
  end)
end

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
    buffer_previewer_maker = previewer,
    dynamic_preview_title = true,
    layout_strategy = 'flex',
    layout_config = {
      scroll_speed = 1,
      bottom_pane = {
        prompt_position = 'bottom',
        height = 0.7,
      },
      vertical = {
        preview_cutoff = 20,
        preview_height = 0.6,
      },
      flex = {
        flip_columns = 180,
        horizontal = {
          preview_cutoff = 180,
        },
        vertical = {
          preview_cutoff = 20,
        },
      },
    },
    mappings = {
      i = {
        ['<C-j>'] = 'cycle_history_next',
        ['<C-k>'] = 'cycle_history_prev',
      },
    },
    vimgrep_arguments = rgCmd({
      'no-heading', 'with-filename', 'column', 'line-number'
    }),
    winblend = 30,
  },
  pickers = {
    commands = {
      mappings = escToClose,
      theme = 'dropdown',
    },
    find_files = {
      find_command = rgCmd({'files', 'no-ignore-vcs'}),
      path_display = {'smart'},
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
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>', {})
vim.keymap.set('n', '<C-S-p>', '<cmd>Telescope commands<cr>', {})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
