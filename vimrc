syntax on
filetype plugin indent on
set nocompatible

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set number
set relativenumber
set wildmenu
set lazyredraw
set showmatch
set cursorline
set hidden

set hlsearch
set ignorecase
set incsearch
set smartcase

nnoremap j gj
nnoremap k gk

let mapleader=","
inoremap jk <esc>

set noerrorbells
set title
set autoread
set history=1000
set backspace=indent,eol,start
set undofile
set undodir=~/.vim/undodir
set undolevels=1000

 if exists('$TMUX')
    let &t_SI.="\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\" "SI = INSERT mode
    let &t_SR.="\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\" "SR = REPLACE mode
    let &t_EI.="\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\" "EI = NORMAL mode (ELSE)
else
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

endif

call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mcchrish/nnn.vim'
Plug 'aserebryakov/vim-todo-lists'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
call plug#end()

let g:VimTodoListsMoveItems=0

let g:nnn#set_default_mappings=0
let g:nnn#layout={'window': {'width': 0.9, 'height': 0.6, 'highlight': 'Debug'}}
nnoremap <leader>n :NnnPicker %:p:h<CR>

let g:rustfmt_autosave=1

let g:ale_linters = {'rust': ['analyzer']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
highlight ALEError ctermbg=none cterm=underline
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
highlight SignColumn ctermbg=black
