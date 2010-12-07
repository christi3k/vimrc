:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

if has("gui_running")
	colors tesla
	set gfn=Monospace\ 8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-addon-manager
" url: http://github.com/MarcWeber/vim-addon-manager 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tell Vim where to find the autoload function:
" set runtimepath+=~/vim-plugins/vim-addon-manager

" activate the addons called 'vim-addon-manager', 'JSON', 'name1', 'name2'
" This adds them to runtimepath and ensures that plugin/* and after/plugin/*
" files are sourced
" call scriptmanager#Activate(['vim-addon-manager','NERD_tree','vim-fuzzyfinder','phpfolding','taglist_45','php-doc','NERD_commenter','jslint.vim'])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" php-doc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP syntax checking 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>l :!php -l %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD_tree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 40
let NERDTreeShowBookmarks = 1
let NERDTreeQuitOnOpen = 1

map <Leader>t :NERDTreeToggle<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :TlistToggle<CR>
let Tlist_Close_On_Select = 1 
let Tlist_GainFocus_On_ToggleOpen = 1 
let Tlist_Process_File_Always = 1
let Tlist_WinWidth = 55

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defaults I like 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set updatetime=2
" Sets how many lines of history VIM has to remember
set history=1000

set nocp

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set hid "Change buffer - without saving

:nmap <Leader>s :source $MYVIMRC
:nmap <Leader>v :e $MYVIMRC

set number
set autoindent

set cursorline
set statusline==%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

set ruler " Always show current position
set cmdheight=2 "The commandbar height

set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab
set noexpandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr

set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=4<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy finder
" url: https://bitbucket.org/ns9tks/vim-fuzzyfinder/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD **/<CR>
catch
endtry

nnoremap <silent> <Leader>n :FufBuffer<CR>
nnoremap <silent> <Leader>p :FufFileWithCurrentBufferDir<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" phpfolding
" url: http://www.vim.org/scripts/script.php?script_id=1623
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <S-F5> <Esc>:EnableFastPHPFolds<Cr>
map <S-F6> <Esc>:EnablePHPFolds<Cr>
map <S-F7> <Esc>:DisablePHPFolds<Cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"au FileType javascript call JavaScriptFold()

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => autotag.vim 
"""""""""""""""""""""""""""""""
"source ~/.vim/plugin/autotag.vim
 
""""""""""""""""""""""""""""""
" => srcexplor.vim 
"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" The_setting_example_in_my_vimrc_file:-)                                      "
"                                                                              "
" // The switch of the Source Explorer                                         "
nmap <F9> :SrcExplToggle<CR>
"                                                                              "
" // Set the height of Source Explorer window                                  "
let g:SrcExpl_winHeight = 8
"                                                                              "
" // Set 100 ms for refreshing the Source Explorer                             "
let g:SrcExpl_refreshTime = 100
"                                                                              "
" // Set "Enter" key to jump into the exact definition context                 "
"let g:SrcExpl_jumpKey = "<ENTER>"
"                                                                              "
" // Set "Space" key for back from the definition context                      "
let g:SrcExpl_gobackKey = "<SPACE>"
"                                                                              "
" // In order to Avoid conflicts, the Source Explorer should know what plugins "
" // are using buffers. And you need add their bufname into the list below     "
" // according to the command ":buffers!"                                      "
let g:SrcExpl_pluginList = [
         \ "__Tag_List__",
         \ "_NERD_tree_",
         \ "Source_Explorer"
     \ ]
                                                                              "
" // Enable/Disable the local definition searching, and note that this is not  "
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. "
" // It only searches for a match with the keyword according to command 'gd'   "
let g:SrcExpl_searchLocalDef = 1
"                                                                              "
" // Do not let the Source Explorer update the tags file when opening          "
" let g:SrcExpl_isUpdateTags = 0
"                                                                              "
" // Use program 'ctags' with argument '--sort=foldcase -R' to create or       "
" // update a tags file                                                        "
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"                                                                              "
" // Set "<F12>" key for updating the tags file artificially                   "
let g:SrcExpl_updateTagsKey = "<F12>"
"                                                                              "
" Just_change_above_of_them_by_yourself:-)                                     "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

set directory=~/.tmp//

"set iskeyword=!-~,^*,^45,^124,^34,192-255,^_,_
"set iskeyword-=_

" highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" match lines longer than 80 chars
" au InsertEnter * match ErrorMsg '\%>80v.\+'
"
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
