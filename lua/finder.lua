local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.grep_string, {})
vim.keymap.set('n', 'lg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- clear after local search 
vim.keymap.set('n', '<C-c>', ':noh<CR>', {})
