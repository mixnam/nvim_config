return require'packer'.startup(function(use)
    use { "ellisonleao/gruvbox.nvim" }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

end)
