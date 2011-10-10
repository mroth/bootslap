syntax enable               " syntax highlighting
set autoread                " autoread changes to file
set number                  " line numbers
set autoindent smartindent  " auto/smart indent
set smarttab                " tab and backspace are smart
set ttyfast                 " we have a fast terminal
set showmatch				" show matches braces
set cursorline              " highlight line cursor is on


" tab stuff
set expandtab
set shiftwidth=4
set tabstop=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim things that only apply to GUI 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has ("gui_running")
    set go-=T                   " no toolbar
    set guifont=Monaco:h12		" default font and size
    set background=light
endif
