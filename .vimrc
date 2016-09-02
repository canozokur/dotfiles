filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

" Auto open nerdtree if no file is given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open nerdtree with ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Always show airline
set laststatus=2

" Remap leader key
let mapleader = ","
let g:mapleader = ","

" And disable the timeout for <Leader>
set notimeout
set ttimeout

" Map buffer keys
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :bp<CR>

" Always show buffers
let g:airline#extensions#tabline#enabled = 1

" Airline config
" use powerline fonts
let g:airline_powerline_fonts = 1

" Custom mappings
" surround word with double quotes
nnoremap <Leader>" ea"<esc>hbi"<esc>lel
