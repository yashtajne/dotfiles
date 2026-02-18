
set cmdheight=1
set laststatus=2

" =========================
" Plugins
" =========================
call plug#begin('~/.vim/plugged')

" Themes
Plug 'git@github.com:drsooch/gruber-darker-vim'
Plug 'git@github.com:morhetz/gruvbox'
Plug 'git@github.com:devsjc/vim-jb'
Plug 'git@github.com:vim-scripts/eclipse.vim'
Plug 'git@github.com:NLKNguyen/papercolor-theme.git'
Plug 'git@github.com:vim-scripts/darkeclipse.vim'
Plug 'git@github.com:sjl/badwolf'

" For LSP
Plug 'git@github.com:neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" =========================
" Coc LSP and Intellisence
" =========================
let g:coc_diagnostic_enable_highlight = 1
let g:coc_diagnostic_enable_underline = 1
set updatetime=300
set signcolumn=yes
nnoremap <silent> <C-c> :CocList<CR>


" =========================
" Key unmaps
" =========================
nnoremap w <Nop>
nnoremap b <Nop>
nnoremap <C-n> <Nop>
nnoremap <C-p> <Nop>


" =========================
" Core settings
" =========================
syntax on
set number

set termguicolors
set clipboard=unnamedplus

" set expandtab
" set softtabstop=2
set tabstop=4
set shiftwidth=4
set noexpandtab
set nowrap


" =========================
" UI
" =========================
set encoding=utf-8
" set list
" set listchars=space:·,trail:·
" set fillchars=vert:\|

colorscheme PaperColor
set background=dark
" colorscheme gruvbox
" colorscheme darkeclipse

" let g:jb_enable_unicode=0
" colorscheme jb

let g:badwolf_darkgutter = 1
let g:badwolf_html_link_underline = 0
let g:badwolf_css_props_highlight = 1
" colorscheme badwolf


" =========================
" Faster cursor movement
" =========================
nnoremap <silent> <C-j> 10j
nnoremap <silent> <C-k> 10k
nnoremap <silent> <C-h> b
nnoremap <silent> <C-l> w


" =========================
" Resize windows
" =========================
nnoremap <silent> H :vertical resize -5<CR>
nnoremap <silent> J :resize -5<CR>
nnoremap <silent> K :resize +5<CR>
nnoremap <silent> L :vertical resize +5<CR>


" =========================
" Save file
" =========================
nnoremap <silent> <C-s> :w<CR>
vnoremap <silent> <C-s> :w<CR>
