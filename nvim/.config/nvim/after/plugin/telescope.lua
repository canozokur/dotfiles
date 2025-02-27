local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
vim.keymap.set('n', '<C-o>', function() builtin.find_files({cwd = utils.buffer_dir() }) end, {})
vim.keymap.set('n', '<leader>ps', function() builtin.live_grep({cwd = utils.buffer_dir() }) end, {})
