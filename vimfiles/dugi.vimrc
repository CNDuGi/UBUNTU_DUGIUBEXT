set tags=tags

set nocompatible

set history=400

set autoread

set mouse=a

syntax enable

syntax on

colorscheme ron

"VIM user interface

"Set 7 lines to the curors away from the border ,when moving vertical..
set so=3

"Turn on Wild menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 hight
set cmdheight=2

"Show ling number
set nu

"Set backspace
set backspace=eol,start,indent

"Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

"Imediately show the search result
set is

""""""""""""""""""""""""""""""""""""""
" Folding config
"""""""""""""""""""""""""""""""""""""""
"Enable folding, very usefule
set nofen
set fdl=0

"""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""
"set expandtab
set shiftwidth=2
set ambiwidth=double
set smarttab

"Set Tab=4 spaces
set ts=4
set lbr
set tw=500
set selection=inclusive
    """""""""""""""""""""""""""""""
    " Indent
    """""""""""""""""""""""""""""""
    "Auto indent
     set ai
     "Set auto indent width = 4 spaces
     set sw=4
     "Smart indent
     set si

     "C-stype indenting
     set cindent "Usage:select codes,press '=' key,the codes auto indent

     "Wrap lines
     set wrap


""""""""""""""""""""""""""""""""""""
" Encoding settings
""""""""""""""""""""""""""""""""""""
if has("multi_byte")

    "CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        "Use cp936 to support GBK,euc-cn==gb2312
        set encoding=cp936
        set termencoding=cp936
        set fileencoding=cp936
    elseif v:lang =~ "^zh_TW"
        set encoding=big5
        set termencoding=big5
        set fileencoding=big5
    elseif v:lang=~ "^ko"
        set encoding=euc-kr
        set termencoding=euc-kr
        set fileencoding=euc-kr
    endif

    "Default UTF-8 locae,and replace CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
        set termencoding=utf-8
        set fileencoding=utf-8
    endif
endif



""""""""""""""""""""""""""""""""""""
"Plugins setting
""""""""""""""""""""""""""""""""""""
" Tlist
if &diff
let Tlist_Auto_Open=0 "Don't auto open when compare two files
else
"let Tlist_Auto_Open=1 "Auto open Tlist when open a file
endif

"new-omni-completion
filetype plugin indent on
set completeopt=longest,menu
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"Set taglist window in right
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1
"Auto close Tlist when exiting file
let Tlist_Exit_OnlyWindow=1

let g:miniBufExplMapWindowNavArrows = 1

"nmap  <C-g> :cscope find g <C-R>=expand("<cword>")<CR><CR>
nmap  <C-g> :ta <C-R>=expand("<cword>")<CR><CR>
nmap  <C-h> :cscope find g <C-R>=expand("<cword>")<CR><CR>
nmap  <C-c> :cscope find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <F8> :TlistToggle <CR>
nnoremap <silent> <F5> :copen<CR>
nnoremap <silent> <F6> :cclose<CR>


"cscope setting

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto =1
	set cst
	set nocsverb
"	set cscopetag
"add any database in current directory
    if filereadable("cscope.out")
	    cs add cscope.out
	endif
	set csverb
endif
autocmd BufReadPost *
	\ if line("'\"")>0&&line("'\"")<=line("$") |
	\	exe "normal g'\"" |
	\ endif

"配置聚焦颜色
"set cursorline
"highlight CursorLine   cterm=NONE ctermbg=green ctermfg=lightgray guibg=darkred guifg=white

"set cursorcolumn
"highlight CursorColumn cterm=NONE ctermbg=green ctermfg=lightgray guibg=darkred guifg=white
