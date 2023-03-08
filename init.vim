
call plug#begin()

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

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

" NERDTree opts
" autocmd vimenter * NERDTree
let g:NERDTreeWinSize=60
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> nf :NERDTreeFind<CR> 

" replcare shortcat
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" tabs
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

" lines
set nu

