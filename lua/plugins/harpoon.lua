local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'
-- local tree_marks = require 'nvim-tree.api'.marks

require("telescope").load_extension('harpoon')

vim.keymap.set('n', '<leader>ha', function(node)
    mark.add_file(node)
    -- tree_marks.toggle(node)
end)
vim.keymap.set('n', '<leader>hr', function(node)
    mark.rm_file(node)
    -- tree_marks.toggle(node)
end)

vim.keymap.set('n', '<leader>hm', function()
    local config = require('telescope.themes').get_dropdown({})
    config.initial_mode = 'normal'
    require('telescope').extensions.harpoon.marks(config)
end, {})
vim.keymap.set('n', '[h', ui.nav_next, {})
vim.keymap.set('n', ']h', ui.nav_prev, {})
