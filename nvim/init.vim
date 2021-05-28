set clipboard+=unnamedplus

syntax on

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set number	
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell	
 
set hlsearch	
set smartcase
set incsearch	
 
set autoindent	
set cindent
set shiftwidth=4
set smartindent	
set smarttab	
set softtabstop=4
set tabstop=4
 
set ruler	
 
set undolevels=1000
set backspace=indent,eol,start

call plug#begin(stdpath('data') . '/plugged')

" sick theme
Plug 'morhetz/gruvbox'

" faster grep
Plug 'jremmen/vim-ripgrep'

" Idk
Plug 'tpope/vim-fugitive'

" manfiles
Plug 'vim-utils/vim-man'

" Idk
Plug 'lyuts/vim-rtags'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Completion
Plug 'https://github.com/Valloric/YouCompleteMe'

" Undo
Plug 'mbbill/undotree'

" Powerline
Plug 'https://github.com/vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
Plug 'https://github.com/vim-airline/vim-airline-themes'
let g:airline_theme='gruvbox'

" async ?
Plug 'prabirshrestha/async.vim'

" lsp stuff
Plug 'prabirshrestha/vim-lsp'
if executable('clangd') "clangd stuff
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif
