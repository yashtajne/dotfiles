
set cmdheight=1
set laststatus=2

" =========================
" Plugins
" =========================
call plug#begin('~/.vim/plugged')

" Themes
Plug 'git@github.com:NLKNguyen/papercolor-theme.git'
Plug 'git@github.com:drsooch/gruber-darker-vim'
Plug 'git@github.com:morhetz/gruvbox'

call plug#end()


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
