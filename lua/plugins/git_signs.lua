require 'gitsigns'.setup({
    on_attach = function()
        local gs = package.loaded.gitsigns

        -- Navigation
        vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        vim.keymap.set({ 'n', 'v' }, '<leader>gr', gs.reset_hunk)
        vim.keymap.set({ 'n', 'v' }, '<leader>gs', gs.stage_hunk)
        vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk)
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk)
    end
})
