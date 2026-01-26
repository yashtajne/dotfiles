call plug#begin('~/.vim/plugged')

Plug 'drsooch/gruber-darker-vim'
Plug 'morhetz/gruvbox'

call plug#end()

nnoremap w <Nop>
nnoremap b <Nop>
nnoremap <C-n> <Nop>
nnoremap <C-p> <Nop>

syntax on
set number

set termguicolors
set clipboard=unnamedplus

set tabstop=4
set noexpandtab
set shiftwidth=4
set nowrap

" set list
" set listchars=tab:│·,trail:·
" set listchars=tab:»·,trail:·,space:·

" Faster cursor movement
nnoremap <silent> <C-j> 10j
nnoremap <silent> <C-k> 10k
nnoremap <silent> <C-h> b
nnoremap <silent> <C-l> w

" Resize
nnoremap <silent> H :vertical resize -5<CR>
nnoremap <silent> J :resize -5<CR>
nnoremap <silent> K :resize +5<CR>
nnoremap <silent> L :vertical resize +5<CR>

" Save file
nnoremap <silent> <C-s> :w<CR>
vnoremap <silent> <C-s> :w<CR>

" Edit file
nnoremap <C-e> :e 

augroup DimListChars
  autocmd!
  autocmd ColorScheme * highlight SpecialKey ctermfg=7 guifg=#444444
augroup END

colorscheme GruberDarker
" colorscheme gruvbox
set background=dark
