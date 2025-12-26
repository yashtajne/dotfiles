call plug#begin('~/.vim/plugged')

Plug 'drsooch/gruber-darker-vim'

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

set list
set listchars=tab:»·,trail:·

" Faster cursor movement
nnoremap <silent> <C-j> 10j
nnoremap <silent> <C-k> 10k
nnoremap <silent> <C-h> b
nnoremap <silent> <C-l> w

" Save file
nnoremap <silent> <C-s> :w<CR>
vnoremap <silent> <C-s> :w<CR>



augroup DimListChars
  autocmd!
  autocmd ColorScheme * highlight SpecialKey ctermfg=7 guifg=#444444
augroup END

colorscheme GruberDarker
