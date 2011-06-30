"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"store lots of :cmdline history
set history=1500

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set number      "show line numbers

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

    set colorcolumn=+1 "mark the ideal max text width
endif

"default indent settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
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
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == NERD_tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 40
let NERDTreeShowBookmarks = 1
let NERDTreeQuitOnOpen = 1

map <Leader>t :NERDTreeToggle<CR>
map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <F2> :TlistToggle<CR>
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_WinWidth = 35
let tlist_php_settings = 'php;c:class;f:Functions'
"let Tlist_Use_Right_Window=1
"let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Display_Tag_Scope = 1
"let Tlist_Process_File_Always = 1
let Tlist_Show_One_File = 1
let Tlist_Display_Prototype = 1
let Tlist_Sort_Type = "name"

"explorer mappings
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TlistToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>