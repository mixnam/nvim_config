let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

" hrsh7th/nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/luasnip'

" tpope/vim-commentary
Plug 'tpope/vim-commentary'

call plug#end()

lua require("init")

" replcare shortcat
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" tabs
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

" lines
set nu

