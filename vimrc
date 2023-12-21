"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" temporary work around for:
" https://github.com/vim/vim/issues/3117
"if has('python3')
  "silent! python3 1
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => System-specifc settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win32")
  let g:pathogen_blacklist= []
endif

if has("mac")
  "let g:pathogen_blacklist= ['vim-buffet']
endif

if has("unix")
  let g:pathogen_blacklist= ['dash']
endif

let g:pathogen_blacklist = ['pydiction', 'vim-buffet']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugins with Pathogen 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use deoplete.
"let g:deoplete#enable_at_startup = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
        set background=dark

        " specify font correct way for each system
        if has("gui_gtk")
          set guifont=Roboto\ Mono\ for\ Powerline\ 14
        endif
        if has("mac")
          set guifont=RobotoMono\ Nerd\ Font:h14
          "set guifont=Roboto\ Mono\ for\ Powerline:h14
        endif

        set lines=60 columns=145
        colorscheme base16-outrun-dark
        "colorscheme base16-atelier-heath
        "colorscheme base16-brewer
        "colorscheme base16-atelier-cave
        "colorscheme base16-default-dark
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

set encoding=UTF-8

"use M- for Option/alt
" and D- for command
" (not sure what this does to special char entry)
set macmeta

" close preview window after omnicompletion
autocmd CompleteDone * pclose

"enable folding
set foldmethod=syntax
set foldlevel=99

let g:python_highlight_all=1

"quick access to spellcheck
:map <F5> :setlocal spell! spelllang=en_us<CR>

"dash
:nmap <silent> <leader>l <Plug>DashSearch

"airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='tomorrow'
let g:airline_theme='base16'
"let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#taboo#enabled = 1

" buffet
" note: don't use buffer because airline does a good enough job
"let g:buffet_show_index = 1
"let g:buffet_powerline_separators = 1
"let g:buffet_tab_icon = "\uf00a"
"let g:buffet_left_trunc_icon = "\uf0a8"
"let g:buffet_right_trunc_icon = "\uf0a9"

"ale
"let g:ale_completion_enabled = 1
"set omnifunc=ale@completion#OmniFunc
"

"syntastic
let g:syntastic_python_checkers=['pycodestyle']
let g:syntastic_ansible_checkers=['ansible', 'ansible-ansible_lint']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_make_checkers = ['gnumake']
"let g:syntastic_markdown_checkers = ['remark_lint']
let g:syntastic_yaml_checkers = ['yamllint']


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

let g:github_enterprise_urls = ['git@github.office.opendns.com']

" =======================================
" vim-devicons
" =======================================

"let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

"
" =======================================
" startify
" =======================================
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [ '~/Projects/compute-vm', '~/.zshrc' ]

let g:startify_files_number = 15

" =======================================
" golang-specific config
" =======================================
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4
autocmd FileType go setlocal softtabstop=4

" =======================================
" vim-go config
" =======================================
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" =======================================
" vim-markdown
" =======================================

map <Plug> <Plug>Markdown_MoveToCurHeader

" =======================================
" UltiSnips settings
" =======================================
"
" set directories in which UltiSnips searches
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mysnippets"]

" set directory for private snippet editing
let g:UltiSnipsSnippetsDir = "~/.vim/mysnippets"

" =======================================
" YouCompleteMe settings
" =======================================
"
" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme#22253548
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<TAB>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

"let g:ycm_filetype_blacklist = {
      "\ 'tagbar': 1,
      "\ 'notes': 1,
      "\ 'netrw': 1,
      "\ 'unite': 1,
      "\ 'text': 1,
      "\ 'vimwiki': 1,
      "\ 'pandoc': 1,
      "\ 'infolog': 1,
      "\ 'mail': 1
      "\}

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-tab>"
let g:UltiSnipsListSnippets = "<M-l>"

"default:
"g:UltiSnipsJumpForwardTrigger          <c-j>
"g:UltiSnipsJumpBackwardTrigger         <c-k>

" =======================================
" pydiction
" =======================================
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" =======================================
" vim-ansible 
" =======================================
" remedies annoying intent behavior
let g:ansible_unindent_after_newline = 1

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
"noremap <Leader>w :set filetype=mediawiki<CR>

" quick re-arranging of individual lines
noremap - ddp
noremap _ ddP

" upper case word
inoremap <c-u> <esc>gUwi
nnoremap <c-u> gUw

" make writing functions less annoying
inoremap <C-Return> <CR><CR><C-o>k<Tab>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == NERD_TREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 40
let NERDTreeShowBookmarks = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2


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

" configure golang tags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == BUFEXPLORER MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" note: *noremap means no recursive mapping
noremap <Leader>n :BufExplorer<cr>
let g:bufExplorerShowRelativePath=1
let g:bufExplorerShowNoName=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == MOVING AROUND, TABS AND BUFFERS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :tabn<cr>
map <left> :tabp<cr>
map <S-right> :bn<cr>
map <S-left> :bp<cr>

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
let g:CommandTPreferredImplementation='ruby'
noremap <leader>t <Esc>:CommandT<CR>
noremap <leader>T <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == SuperTab & Python misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == delimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == helper shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" normal window mode in terminal
tnoremap <c-b> <c-\><c-n>

" open markdown in Typora
nnoremap <leader>o <Esc>:silent !open -a Typora '%'<CR>

" generate markdown ToC
nnoremap <leader>mt <Esc>:silent !markdown-toc -i '%' --bullets="*"<CR>

