local builtin = require('telescope.builtin')
local telescope = require('telescope')
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["d"] = "delete_buffer"
                }
            }
        }
    },
    extensions = {
        harpoon = {
            initial_mode = 'normal'
        },
        live_grep_args = {
            -- auto_quoting = true, -- enable/disable auto-quoting
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
        }
    }
}

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>tr', ':Telescope resume<CR>', {})
vim.keymap.set('n', '<leader>ts', ':Telescope git_status<CR>', {})
vim.keymap.set('n', 'gg', telescope.extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', 'gr', function()
    builtin.lsp_references({
        show_line = false,
        layout_config = {
            width = 0.9
        }
    })
end, {})

vim.keymap.set('n', "<Tab>", builtin.buffers, {})
vim.keymap.set('n', '<C-i>', '<C-i>', {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- clear after local search
vim.keymap.set('n', '<C-c>', ':noh<CR>', {})

-- centralize vertical motions
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})

vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("CmdlineEnter", {
    callback = function()
        vim.opt.relativenumber = false
        vim.cmd("redraw")
    end
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.opt.relativenumber = true
        vim.cmd("redraw")
    end
})
