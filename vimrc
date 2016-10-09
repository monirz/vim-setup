" ==================================================
" .vimrc / init.vim
" ==================================================
" execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch'
Plug 'themue/vim-gode'
Plug 'tpope/vim-fugitive'
Plug 'fishcakez/vim-rebar'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vimoutliner/vimoutliner'
call plug#end()
" --------------------------------------------------
" SETTINGS
" --------------------------------------------------
filetype off
filetype plugin indent off
set autoread
set incsearch
set ignorecase
set smartcase
set hlsearch
set number
set relativenumber
set cursorline
set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0
set guifont=Hack:h13
set shell=bash
set mouse=a
set ttymouse=xterm2
set wildignore+=*/logs/*,*.beam
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

set t_Co=256
colorscheme muedark
syntax on

let mapleader = "-"
let maplocalleader = "="
let g:airline#extensions#tabline#enabled = 1
let g:SuperTabDefaultCompletionType = "<C-X><C-N>"
let g:erlang_tags_ignore = "_build"
let g:airline_theme = "bubblegum"
autocmd BufWritePre * :%s/\s\+$//e

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
endif
" --------------------------------------------------
" KEY MAPPINGS
" --------------------------------------------------
"
" Yank and paste
"
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p  "+p
nnoremap <leader>P  "+P
vnoremap <leader>p  "+p
vnoremap <leader>P  "+P

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Searching
"
nmap <leader>s :%s//gc<LEFT><LEFT><LEFT>
nmap <expr> <leader>sr  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'
nmap <leader>g :vimgrep // **/*<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap n nzzzv
nnoremap N Nzzzv
"
" Console
"
nmap <F11>      :cprev<CR>
nmap <S-F11>    :cpfile<CR>
nmap <C-F11>    :colder<CR>
nmap <F12>      :cnext<CR>
nmap <S-F12>    :cnfile<CR>
nmap <C-F12>    :cnewer<CR>
nmap <leader>q  :cclose<CR>
nmap <leader>tt :TagbarToggle<CR>
nmap <leader>qq :qa<CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <S-H> gT
map <S-L> gt
"
" Buffers
"
nmap <leader>j :bnext<CR>
nmap <leader>k :bprevious<CR>
"
" CtrlP
"
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>: :CtrlPTag<cr>
nnoremap <leader># :CtrlPBufTag<cr>
"
" Edit and source .vimrc
"
nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
"
" Misc
"
nnoremap <leader>N :setlocal number!<cr>
" --------------------------------------------------
" ACTIONS
" --------------------------------------------------
if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif
" ==================================================
" EOF
" ==================================================
