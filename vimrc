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
set hidden " Hide buffers rather than delete them

set hlsearch
set ignorecase
set incsearch
set smartcase

nnoremap j gj
nnoremap k gk

let mapleader=","

set noerrorbells
set title
set autoread
set history=1000
set backspace=indent,eol,start
set undofile
set undodir=~/.vim/undodir
set directory=~/.vim/swapfiles
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
Plug 'mcchrish/nnn.vim' " File navigator
Plug 'aserebryakov/vim-todo-lists'
Plug 'dense-analysis/ale' " Linting
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'ziglang/zig.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'SirVer/ultisnips'
call plug#end()

let g:VimTodoListsMoveItems=0

let g:nnn#set_default_mappings=0
let g:nnn#layout={'window': {'width': 0.9, 'height': 0.6, 'highlight': 'Debug'}}
nnoremap <leader>n :NnnPicker %:p:h<CR>

let g:rustfmt_autosave=1

let g:ale_linters = {'rust': ['analyzer'], 'zig': ['zls']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_set_highlights = 1
highlight ALEError ctermbg=none ctermfg=red cterm=underline
highlight ALEWarning ctermbg=none ctermfg=yellow cterm=underline
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
highlight clear SignColumn

" Put diary files in same folder as rest of wiki for easier linking
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki_html/', 'diary_rel_path' : ''}]

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>f :FZF<CR>
nnoremap <leader>p :set paste!<CR>
