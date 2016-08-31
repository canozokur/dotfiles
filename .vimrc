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

" Always show buffers
let g:airline#extensions#tabline#enabled = 1
