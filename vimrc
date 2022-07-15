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

" Set different colors for the cursor, depening on input or viusal mode
if &term =~ "xterm\\|alacritty"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

" Allow setting the cursor to the end of a string in visual mode
set virtualedit=onemore

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixing colors
if has('termguicolors')
    set termguicolors
endif

:colorscheme jellybeans

""let g:edge_enable_italic = 1
""let g:edge_disable_italic_comment = 1

""let g:material_terminal_italics = 1
""let g:material_theme_style = 'ocean'
""let g:sonokai_style = 'shusia'
""let g:sonokai_enable_italic = 1
""colorscheme sonokai


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
