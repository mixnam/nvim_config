return require 'packer'.startup(function(use)
    use { "ellisonleao/gruvbox.nvim" }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
            { 'nvim-lua/plenary.nvim' }
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("live_grep_args")
            telescope.load_extension('harpoon')
        end
    }

    use {
        "ThePrimeagen/harpoon"
    }

    use { "tpope/vim-fugitive" }

    use {
        'lewis6991/gitsigns.nvim'
    }

    use {
        'tikhomirov/vim-glsl'
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
end)
