"Configuracion basica de nvim 

set number 
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler 
set encodig=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2

call plug#begin('~/.vim/plugges')

"Syntax
Plug'sheerun/Vim-polyglot'

"Status bar
Plug 'itchyny/lightline.vim'

"Tree
Plug 'scrooloose/nerdtree'

"Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

"autocoplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sbdchd/neoformat'
Plug 'yggdroot/indentLine'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

" Vim Script
colorscheme tokyonight
let mapleader=" "
let NERDTreeQuitOnOpen=1
let g:deoplete#enable_at_startup = 1
let g:lightline = {'colorscheme': 'tokyonight'}

"Configuracion de letras

nmap <Leader>s <Plug>(easymotion-s2) 
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>w :w!<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>p :PlugInstall<CR>
nmap <Leader>f :FZF<CR>


"lightline
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }



autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | end
ifinoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

