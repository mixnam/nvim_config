vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require 'plugins'
require 'plugins.telescope'
require 'plugins.lsp'
require 'plugins.theme'
require 'plugins.harpoon'
require 'plugins.git_signs'
require 'plugins.fugitive'
require 'plugins.nvim_tree'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
