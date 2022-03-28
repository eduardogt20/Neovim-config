"Configuracion basica de nvim 

set number 
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
set laststatus=2


call plug#begin('~/.vim/plugges')

"Theme

Plug 'tiagovla/tokyodark.nvim'

"Lsp

Plug 'neovim/nvim-lspconfig'

"Autocomplete

Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Syntax

Plug'sheerun/Vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'lukas-reineke/indent-blankline.nvim'

"Format

Plug 'sbdchd/neoformat'

"Status Bar`s

Plug 'itchyny/lightline.vim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'


"Git 
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

"Tree

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Navigation

Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'karb94/neoscroll.nvim'

call plug#end()

"Theme

let g:tokyodark_color_gamma = "1.0"
colorscheme tokyodark

"Lsp

lua << EOF
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attachc}
EOF

"Format

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"Bufferline

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

" Vim Script

let mapleader=" "
let NERDTreeQuitOnOpen=1
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:deoplete#enable_at_startup = 1
let g:lightline = {'colorscheme': 'tokyonight'}

"Configuracion de letras

nmap <Leader>s <Plug>(easymotion-s2) 
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>w :w!<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>p :PlugInstall<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>g :DiffviewFileHistory<CR>
nmap <Leader>t :Neoformat! python<CR>

"lightline

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
      
"nerdtree git

let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusGitBinPath = '/your/file/path'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
                
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | end
