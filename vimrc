"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => System-specifc settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win32")
  let g:pathogen_blacklist= []
endif

if has("mac")
  let g:pathogen_blacklist= []
endif

if has("unix")
  let g:pathogen_blacklist= ['dash']
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
        set background=dark

        " specify font correct way for each system
        if has("gui_gtk")
          set guifont=Roboto\ Mono\ for\ Powerline\ 12
        endif
        if has("mac")
          set guifont=Roboto\ Mono\ for\ Powerline:h13
        endif

        set lines=50 columns=125
        colorscheme solarized
        " remove toolbar
        set guioptions=agiLtm
        nnoremap <F4> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
        " remove right scrollbar
        "set guioptions-=r
        "airline
else
        "set background=dark
        "set t_Co=256
        let g:solarized_termcolors=256
endif

"let g:solarized_termcolors=256

"enable folding
set foldmethod=syntax
set foldlevel=99

let g:python_highlight_all=1

"dash
nmap <silent> <leader>s <Plug>DashSearch

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"syntastic
let g:syntastic_python_checkers=['pyflakes']

"enable modelines
set modeline

"store lots of :cmdline history
set history=1550

"swap & recovery
set updatecount=50
"set swapsync   "can be wearing on SSDs

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set number      "show line numbers

"display tabs and trailing spaces
" this overwrites linebreak
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

"highlight current line
set cursorline

"seraching
set incsearch   "incremental search find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase  "ignorecase
set smartcase   "ignore case as long as input is lowercase
nmap <silent> <BS> :nohlsearch<CR>

"smarter completion
set wildmode=list:longest

"set temp directory
set dir=~/.tmp

set wrap        "wrap lines
set linebreak   "wrap lines at convenient points

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

    set colorcolumn=+1 "mark the ideal max text width
endif

"default indent settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
"set smarttab ??

"load ftplugins and indent files
filetype plugin on
filetype indent on

"hide buffers when not displayed
set hidden

set statusline==%F%m%r%h%w\ [branch=%{fugitive#statusline()}]\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set laststatus=2

set ruler " Always show current position
set cmdheight=2 "The commandbar height

" pydict
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" =======================================
" OLD
" =======================================

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast editing of the .vimrc
nnoremap <leader>e :e! ~/.vim/vimrc<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == MISC SHORT CUTS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>w :set filetype=mediawiki<CR>

" quick re-arranging of individual lines
noremap - ddp
noremap _ ddP

" upper case word
inoremap <c-u> <esc>gUwi
nnoremap <c-u> gUw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == NERD_TREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 40
let NERDTreeShowBookmarks = 1
let NERDTreeQuitOnOpen = 1

map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <F2> :TagbarOpenAutoClose<CR>
nnoremap <F2> :TagbarToggle<CR>
" display tagbar on the left
let g:tagbar_left = 1
" autofocus on tagbar after opening
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == BUFEXPLORER MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" note: *noremap means no recursive mapping
noremap <Leader>n :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == MOVING AROUND, TABS AND BUFFERS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for the notes plugin
"let notes_directory = '~/Dropbox/Notes/'
let notes_directories = ['~/SpiderOak\ Hive/Notes/']

" set temp directory
set directory=~/.tmp//

" useful binding for ack
nnoremap <leader>a <Esc>:Ack!<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == CommandT Plugin 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>t <Esc>:CommandT<CR>
noremap <leader>T <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == SuperTab & Python misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == LVTHW Practice
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowCat()
  echom ">^.^<"
endfunction

call ShowCat()

iabbrev @@ ck@christi3k.net

" go to beginning of line w/o leaving home
nnoremap H 0

" go to end of line w/o leaving home
nnoremap L $

" ease leaving insert mode
inoremap jk <esc>

