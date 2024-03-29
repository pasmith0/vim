
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Display Unicode chars
" Might need to use the following command to write this file: w ++enc=utf-8
set termencoding=utf-8 
set encoding=utf-8 nobomb
scriptencoding utf-8

" Load pathogen plugin installer
"execute pathogen#infect()

filetype plugin indent on
"syntax on

" OS detection
if has("win32") || has("win16")
   "echom "WIN----"

   "Windows
   source $VIMRUNTIME/vimrc_example.vim
   source $VIMRUNTIME/mswin.vim
   "source $USERPROFILE/vimfiles/autocommands

   " These annoying mappings get turned on in mswin.vim
   " when running gui vim.
   if has("gui_running") 
      "echom "GUI----"
      unmap <C-F>
      unmap <C-H>
      set guifont=Consolas:h12 
      set guioptions-=T
      set guioptions-=a
      set guioptions+=b
   endif
endif

"let uname = substitute(system('uname'), '\n', '', '')
"let uname = uname[0:4]
"echom "uname=" uname

if filereadable(expand("$HOME/.vim/autocommands"))
   "echom "PT1"
   source $HOME/.vim/autocommands
   source $HOME/.vim/.vimrc_colors
elseif filereadable(expand("%USERPROFILE%/.vim/autocommands"))
   "echom "PT2"
   source $HOME/.vim/autocommands
   source $HOME/.vim/.vimrc_colors
elseif filereadable(expand("$HOME/vimfiles/autocommands"))
   "echom "PT3"
   source $HOME/vimfiles/autocommands
   source $HOME/vimfiles/.vimrc_colors
elseif filereadable(expand("%USERPROFILE%/vimfiles/autocommands"))
   "echom "PT4"
   source $HOME/vimfiles/autocommands
   source $HOME/vimfiles/.vimrc_colors
endif

"if uname == "Linux"
   " Linux
"   set guifont=AndaleMono\ 16
"elseif uname == "Darwi"
   " MACOS
"   set guifont=Menlo:h16
"else
   " Unknown OS?
"endif

" Basic appearance
syntax enable

"Statusline options - if not using Airline
" %m=modified flag, %r=readonly flag, %h=help buffer flag, %w=preview window flag
" ff=line ending type (unix, dos)
set statusline=%F%m%r%h%w%=\ [Type:%Y]\ [LE:%{&ff}]\ [Buf:%n]\ [Line:%l/%L\ %p%%]\ [Col:%v]

" Set behavior for mouse and selection (yes even on non-Windows systems)
behave mswin

" Display Unicode chars
"set termencoding=utf-8 
"set encoding=utf-8 nobomb

" Print the line numbers
set number

" Don't like wrapping (usually)
set nowrap

" Always display status line
set laststatus=2

" Turn off backups
set nobackup
set nowritebackup

" Turn off automatically saving undo history to an undo file
set noundofile

" Tab stuff
set tabstop=4
set expandtab

" Turn off digraphs, I accidently enter them a lot
set nodigraph

set autoindent
set autowrite
set noerrorbells

" backspace and cursor keys wrap to previous/next line
set backspace=2 whichwrap+=<,>,[,]

" Put a $ at the end of a line or word to change.
set cpoptions=$

" Turn off icon text of window
set noicon

" Hide buffers when abandoned.
set hidden

" Turn off modeless vim
set noinsertmode

" Set highlighting mode for various things
"set highlight=8r,db,es,hs,mb,Mr,rs,sr,tb,vr,ws
" Don't highlght special (unprintable) chars (8r)
set highlight=db,es,hs,mb,Mr,rs,sr,tb,vr,ws

" helpheight: zero disables this.
set helpheight=0
set iskeyword=@,48-57,_,192-255,-,.
set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-

" Do not update screen while executing macros
set lazyredraw

" Allow usage of cursor keys within insert mode
set esckeys

" Specify how automatic formatting is to be done.
" c   Auto-wrap comments using textwidth, inserting the current comment leader automatically.
" q   Allow formatting of comments with "gq".
" r   Automatically insert the current comment leader after hitting	<Enter> in Insert mode.
" t   Auto-wrap text using textwidth
set formatoptions=cqrt

" Don't insert two spaces after a '.', '?' and '!' with a join command.
set nojoinspaces

" Set dictionary to use English words first
set dictionary=/usr/dict/words

" Show the line and column number of the cursor position
set ruler

" shiftwidth: Number of spaces to use for each insertion of (auto)indent.
set shiftwidth=4
"
" Use abbreviated messages
set shortmess=atI

" Search related
set noincsearch
set ignorecase
set hlsearch
set magic

" report: show a report when N lines were changed.
"         report=0 thus means "show all changes"!
set report=0

" showcmd:     Show current uncompleted command?  Absolutely!
set showcmd

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" If in Insert, Replace or Visual mode put a message on the last line.
" Use the 'M' flag in 'highlight' to set the type of highlighting for this message.
"set showmode

" Files with these suffixes get a lower priority when multiple files match a wildcard
set suffixes=.bak.swp,.d

" tty stuff
" ttyfast: are we using a fast terminal?
"          seting depends on where I use Vim...
set nottyfast

" When off the builtin termcaps are searched after the external ones
set nottybuiltin

" Maximum number of lines to scroll the screen
set ttyscroll=0

" What info to store from an editing session in the viminfo file
set viminfo='50,\"100,:100,n~/.viminfo

" No beep or flash for terminal bell.
set visualbell
set t_vb=

" Allow specified keys that move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in
" the line. '<' = left, '>' = right.
set whichwrap=<,>

" Character used for "expansion" on the command line
set wildchar=<TAB>

" Number of lines of command line history to keep
set history=50

" Filenames for the tag command, separated by spaces or commas.
set tags=./tags,tags

"
" User-defined commands
"

" Delete buffer and go to previous buffer without closing split
command! BUN bp\|bun \# 
command! BD bp\|bd \# 
command! BW bp\|bw \# 


" This shows whitespace characters but doesn't work perfectly.

"function! Whitespace()
"    if !exists('b:ws')
"        highlight Conceal ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
"        highlight link Whitespace Conceal
"        let b:ws = 1
"    endif
"
"    syntax clear Whitespace
"    syntax match Whitespace / / containedin=ALL conceal cchar=·
"    setlocal conceallevel=2 concealcursor=c
"endfunction
"
"augroup Whitespace
"    autocmd!
"    autocmd BufEnter,WinEnter * call Whitespace()
"augroup END


