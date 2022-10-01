"Configuracion basica de nvim 
set number
set mouse =a
set numberwidth =1
set clipboard =unnamed
syntax on
set showcmd
set ruler
set encoding =UTF-8
set showmatch
set sw =2
set relativenumber
set laststatus =2


call plug#begin('~/.vim/plugges')

"Theme
Plug 'navarasu/onedark.nvim'

"Lsp
Plug 'neovim/nvim-lspconfig'

"Autocomplete
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"Syntax
Plug 'sheerun/Vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Status Bar`s
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

"Icons
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'

"Git 
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

"Tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'

"Navigation
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'karb94/neoscroll.nvim'

call plug#end()

"Theme
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark

"Tree
lua << END
require'nvim-tree'.setup {}
END

"Lsp
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.jedi_language_server.setup{}
EOF

"Bufferline
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

"lualine
lua << END
require('lualine').setup()
END

"Neoscroll
lua << END
require('neoscroll').setup()
END

"Gitsings
lua << END
require('gitsigns').setup()
END

"Icons
lua << END
require'nvim-web-devicons'.get_icons()
END

" Vim Script
let mapleader=" "
let g:deoplete#enable_at_startup = 1

"Identation
lua << END
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
END

"Configuracion de letras
nmap <Leader>s <Plug>(easymotion-s2)
nmap <leader>n :NvimTreeToggle<CR>
nmap <leader>nr :NvimTreeRefresh<CR>
nmap <leader>nf :NvimTreeFindFileToggle<CR>
nmap <Leader>w :w!<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>p :PlugInstall<CR>
nmap <Leader>f :Telescope find_files<CR>
nmap <Leader>fb :Telescope buffers<CR>
nmap <Leader>g :DiffviewFileHistory<CR>
nmap <Leader>t :Neoformat! python<CR>

nmap <Leader>1 :BufferLineGoToBuffer 1<CR>
nmap <Leader>2 :BufferLineGoToBuffer 2<CR>
nmap <Leader>3 :BufferLineGoToBuffer 3<CR>
nmap <Leader>4 :BufferLineGoToBuffer 4<CR>
nmap <Leader>5 :BufferLineGoToBuffer 5<CR>
nmap <Leader>6 :BufferLineGoToBuffer 6<CR>
nmap <Leader>7 :BufferLineGoToBuffer 7<CR>
nmap <Leader>8 :BufferLineGoToBuffer 8<CR>
nmap <Leader>9 :BufferLineGoToBuffer 9<CR>

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | end
