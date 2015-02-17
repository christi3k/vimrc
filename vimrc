"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
        set background=dark
        "colors neverland-darker
        "set gfn=Liberation\ Mono\ for\ Powerline\ 9
        set gfn=Ubuntu\ Mono\ derivative\ Powerline\ 11
        set lines=50 columns=125
        colorscheme solarized
        " remove toolbar
        set guioptions=agiLt
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

"powerline (deprecated in favor of airline)
"let g:Powerline_symbols = 'fancy'

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

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

map <Leader>t :NERDTreeToggle<CR>
map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == TAGLIST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <F2> :TlistToggle<CR>
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_WinWidth = 35
let tlist_php_settings = 'php;c:class;f:functions;d:constants;i:interfaces;v:variables'
"let Tlist_Use_Right_Window=1
let Tlist_Display_Tag_Scope = 1
let Tlist_Show_One_File = 1
"let Tlist_Display_Prototype = 1
let Tlist_Sort_Type = "name"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == EXPLORER MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" note: *noremap means no recursive mapping
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :TlistToggle<cr>
nnoremap <f3> :NERDTreeToggle<cr>
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
let notes_directories = ['~/Dropbox/Notes/']

" set temp directory
set directory=~/.tmp//

" useful binding for ack
nnoremap <leader>a <Esc>:Ack!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == PDV (phpDocumentor for Vim) 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
"nnoremap <C-P> :call PhpDocSingle()<CR> 
"vnoremap <C-P> :call PhpDocRange()<CR> 
"let g:pdv_cfg_Author = "Christie Koehler <christiekoehler@gmail.com>"

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

