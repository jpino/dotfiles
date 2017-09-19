" Neovim configuration. Work in progress.


"
" Plugins
"
call plug#begin('~/.config/nvim/plugged')

" Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'chriskempson/base16-vim'

call plug#end()


"
" General settings
"
set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
"set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
"set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
"set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
"set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=160                           " Don't try to syntax highlight minified files
set nospell
set mouse=a
set ruler


"
" Search
"
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search

set list                                    " Show listchars by default
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
"set showbreak=↪


"
" Colors
"
let base16colorspace=256
"set background=dark
if filereadable(expand("~/.config/colors.vim"))
    source ~/.config/colors.vim
else
    colorscheme base16-eighties
endif


"
" Indendation
"
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab


"
" Key mappings
"
let mapleader=";"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Leader>w :update<CR>

" Copy to and paste from the system clipboard (register +)
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y



" TODO:
" Remove trailing whitespaces automatically before save   


"
" Reload init.vim on save
"
autocmd! bufwritepost $MYVIMRC source $MYVIMRC


"
" No backups
"
set nobackup
set nowb
set noswapfile
