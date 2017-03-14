syntax on                       " syntax highlighing on
set background=dark				" dark background instead of light
let g:solarized_termcolors=256
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
colorscheme solarized			" located in ~/.vim/colors/solarized.vim
set tabstop=4                   " 4 spaces per tab
set shiftwidth=4                " shift 4 spaces on tab
set autoindent                  " auto indent new line
set smartindent                 " smart indent

" SEARCHING
set hlsearch                    " highlight the search
set diffopt=filler,iwhite       " ignore all whitespace and sync
set incsearch                   " highlight as we search however
set matchtime=5                 " blink matching brackets for .x seconds
set mouse=a                     " try to use a mouse in the console (wimp!)
set ignorecase                  " set case insensitivity
set smartcase                   " unless there's a capital letter
set completeopt=menu,longest,preview " more autocomplete <Ctrl>-P options
set nostartofline               " leave my cursor position alone!
set backspace=2                 " equiv to :set backspace=indent,eol,start
set noshowmatch                   " do not show matching brackets
" CENTER WHILE SEARCHING
map n nzz
map N Nzz

" LOOK AND FEEL
set cmdheight=1                 " explicitly set the height of the command line
set showcmd                     " Show (partial) command in status line.
set ruler                       " show current position at bottom
set scrolloff=10                " keep at least 5 lines around the cursor
set cul                         " highlight current line

"set number                     " show line numbers
" colorscheme elflord			" one of macvims default themes


" ENCODING
set encoding=utf-8 fileencoding=utf-8 " force unicode

" GUI (MACVIM, GVIM, ETC)
if has("gui_running")
	set antialias                       " Smooth fonts.
	set guioptions=egmrt                " Tabs, grey menu items, menu bar, right scrollbar, tearoff menu items
endif
