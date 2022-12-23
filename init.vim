
call plug#begin()

" https://github.com/mmorhetz/gruvbox
Plug 'morhetz/gruvbox'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> nf :NERDTreeFind<CR> 

" colorscheme
set background=dark
colorscheme gruvbox

" fzf
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Rg <C-R><C-W><CR>
nnoremap <C-l> :BLines<CR>
nnoremap <silent> <Space> :Buffers<CR>

" replcare shortcat
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" tabs
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4

" lines
set nu

