"
" Plugins
"
call plug#begin('~/.config/nvim/plugged')

" General
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-surround'

" Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}


" Rust
"Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"let g:ale_completion_enabled = 1
" let g:ale_lint_on_text_changed = 'never'
" Plug 'w0rp/ale', { 'for': 'rust' }
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins', 'for': 'rust'  }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': 'rust' }
"Plug 'sebastianmarkow/deoplete-rust', { 'do': ':UpdateRemotePlugins', 'for': 'rust' }
"Plug 'racer-rust/vim-racer', { 'do': ':UpdateRemotePlugins', 'for': 'rust' }

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()


"
" General settings
"
filetype plugin indent on
set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
set number                                  " Line numbers on
"set relativenumber
"set noshowmode                                " Always show mode
set showcmd                                 " Show commands as you type them
"set textwidth=120                           " Text width is 120 characters
set cmdheight=2                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is iover them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
"set nojoinspaces                            " No extra space when joining a line which ends w ith . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
"set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=160                           " Don't try to syntax highlight minified files
set nospell
set mouse=a
set ruler
set cursorline
set list                                    " Show listchars by default
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·




"
" Search
"
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search


"
" Colors
"
let base16colorspace=256

colorscheme automatic

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
vnoremap < <gv
vnoremap > >gv


"let mapleader=";
noremap <Space> <Nop>
let mapleader = "\<Space>"


"
" Buffers
"
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"
" fzf commands
"
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>/ :Find<space>

" Find inside files
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

"
" Key mappings
"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd<CR>

" Copy to and paste from the system clipboard (register +)
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y




"
" Reload init.vim on save
"
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

nnoremap <F5> :source $MYVIMRC<CR>


"
" No backups
"
set nobackup
set nowb
set noswapfile



" Snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"
" Status line
"
set statusline=
set statusline+=[%{StatuslineMode()}]    " mode
set statusline+=\ 
set statusline+=%f                       " file name
set statusline+=%m                       " modified flag
set statusline+=\ 
set statusline^=%{coc#status()}
set statusline+=%=                       " right align
set statusline+=%y                       " file type
set statusline+=\ 
set statusline+=[%l,%v]                  " line and column number
set statusline+=\ 
set statusline+=[%p%%]                   " percentage through file

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

