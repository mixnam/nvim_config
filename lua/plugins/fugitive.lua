-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("BufWinEnter", {
--     pattern = "*",
--     callback = function()
--         -- if vim.bo.ft ~= "fugitive" then
--         --     return
--         -- endt
--         local bufnr = vim.api.nvim_get_current_buf()
--         local b = vim.api.nvim_buf_get_name(bufnr)

--         print(vim.inspect(bufnr))
--         print(vim.inspect(b))
--         print(vim.inspect(vim.bo[bufnr]))
--     end
-- })
--
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {})
vim.keymap.set('n', '<leader>gm', ':Git mergetool<CR>', {})
