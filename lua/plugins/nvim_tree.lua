require("nvim-web-devicons").setup {
    default = true,
    override_by_extension = {
        ["tsx"] = {
            icon = "",
            color = "#30f1ff",
            name = "React"
        },
        ["jsx"] = {
            icon = "",
            color = "#30f1ff",
            name = "React"
        }
    }
}

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 50,
    },
    renderer = {
        group_empty = true,
    },
})

vim.keymap.set('n', 'nf', ':NvimTreeFindFile<CR>', {})
