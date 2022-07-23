"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap ESC to ii
:imap ii <Esc>

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

syntax enable
filetype on
set number

" Highlight current cursorline / Highlight cursorline in insert mode
" set cursorline
:autocmd InsertEnter,InsertLeave * set cul!

" Enable modified arrow keys, see  :help arrow_modifiers
execute "silent! set <xUp>=\<Esc>[@;*A"
execute "silent! set <xDown>=\<Esc>[@;*B"
execute "silent! set <xRight>=\<Esc>[@;*C"
execute "silent! set <xLeft>=\<Esc>[@;*D"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Arrow keys to function like other editors, such as nano
set ww+=<,>,[,]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow setting the cursor to the end of a string in visual mode
set virtualedit=onemore

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let &termguicolors = v:true
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

:colorscheme jellybeans

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Trailing spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CleanExtraSpaces() "Function to clean unwanted spaces
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre * :call CleanExtraSpaces()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Convert text to UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8

autocmd BufNewFile,BufRead  *   try
autocmd BufNewFile,BufRead  *   set encoding=utf-8
autocmd BufNewFile,BufRead  *   endtry

"Going over all of this would take too much time
"This basically set everything in utf-8 in every circumtances

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Convert to UNIX fileformat (avoid CRLF)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
"Set every files as Unix (LF) as Windows might set CRLF wich is not working
"for unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set Vim Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $LANG='en'
"Setting env LANG var to english

set langmenu=en
"Setting menu language to en

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set Vim Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let g:netrw_dirhistmax = 0
