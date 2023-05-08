" .vimrc file created for vim
" by Adam Brandeis
" last updated: 2023-04-19

set runtimepath^=~/users/abrandeis/.vim,$VIMRUNTIME,/users/abrandeis/.vim/autoload,~/.vim
set packpath^=~/users/abrandeis/.vim
set nocompatible                " use vim defaults
execute pathogen#infect()

syntax on                       " syntax highlighing
set showcmd                     " display incomplete commands
set nobackup                    " do not keep a backup file
set title                       " show title in console title bar
set ttyfast                     " smoother changes
set modeline                    " last lines in document sets vim mode
set modelines=3                 " number lines checked for modelines
set shortmess=atI               " Abbreviate messages
set nostartofline               " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set autowrite                   " auto saves changes when quitting and swiching buffer

set viminfo=%,<800,'10,/50,:100,h,f0,n/users/abrandeis/.vim/cache/.viminfo  " larger more detailed viminfo cache
"set viminfo='20,<50,s10,h

" ============ SET AWESOME STATUS LINE ============
set ls=2                        " always show status line
set statusline=
set statusline=%#1#%h%w%m%r%R%W                    " flags (h:help:[help], w:window:[Preview], m:modified:[+][-], r:readonly:[RO])
set statusline+=\[%{mode()}]                   " current mode
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \VISUAL\ ':''}

set statusline+=%4*\ %<%F                      " show full path of filename in status line

set statusline+=\                              " blank space
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight type on word

set statusline+=\                              " blank space
set statusline+=%=                             " right-align from now on
set statusline+=%{PasteForStatusline()}        " paste flag

set statusline+=\                              " blank space
set statusline+=\ %y[%{&ff}]                   " filetype and show encoding
set statusline+=[%{GetBG()}\:%{GetCN()}]       " background and colorscheme
set statusline+=\[row\:%(%3l\/%L%)]\           " current row/total num of lines
set statusline+=%P                             " percentage of the file

set statusline+=%#warningmsg#                  " Syntastic error flag
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*                             " Syntastic error flag
"set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*

"The |hl-StatusLine| and |hl-StatusLineNC| groups usually set the colors with
"`term=reverse` which means the foreground color will be used as background
"color, you can change the colors like this: >
    " greyscale statusline
    hi StatusLine   guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=1
    hi StatusLineNC guifg=#808080 guibg=#000000 gui=bold ctermfg=8  ctermbg=0

" ====== colors (for statusline) ======

" using link instead of named highlight group inside the statusline to make it
" easier to customize, reseting the User[n] highlight will remove the link.
" Another benefit is that colors will adapt to colorscheme.

"filename
hi default link User1 Identifier
" flags
hi default link User2 Statement
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special


" ============ Custom Key Bindings and Shortcuts ============
let mapleader=";"    " leader is semi-colon i.e. ;h or ;n

" NUMBERS - enable / disable view NUMBER line
map <leader>n :set nu!<CR>
map <F7> :set nu!<CR>

" PASTE - Toggle paste mode - F11 or leader = ;p
map <leader>p :set invpaste!<CR>
map <F11> :set invpaste!<CR>
set pastetoggle=<F11>
"map <leader>p :set invpaste!<CR>

" HIGHLIGHT - turn off search highlight - leader = ;
" nnoremap <leader><space> :nohlsearch<CR>
map <leader>h :set hlsearch!<cr>
map <F8> :set hlsearch!<cr>

" Show all characters
set listchars=tab:>-,trail:▒,eol:$
nmap <silent> <leader>ls :set nolist!<CR>

" Show tabs - characters
map <leader><tab> :set list!<CR>

" Convert tabs to spaces shortcut hotkey
map <leader><tab><space> :set list<CR> :set expandtab<CR> :retab <CR>

" F10 to togle bg=dark bg=light
map <F10> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" F9 to toggle highlight on off
"map <F9> :let &highlight = ( &highlight == "off"? "on" : "off" )<CR>

" F12 to toggle mouse on off
map <F12> :call ToggleMouse() <CR>

" F9 to toggel word wrap on off
map <F9> :set wrap!<CR>

" Save and quit
map <leader><F4> gg <CR> :wq <CR>

" ============ Indention Options ==== ON
set autoindent       " always set autoindenting on.  New lines inherit the indentation of previous lines.
set smarttab         " Insert .tabstop. number of spaces when the .tab. key is pressed.
set tabstop=4        " numbers of spaces of tab character
set shiftwidth=4     " numbers of spaces to (auto)indent
set smartindent      " smart indent
set cindent          " cindent

" ============ Indention Options NEW ============ [OFF]
filetype indent on   " Enable indentation rules that are file-type specific.
filetype plugin on   " Enable loading the plugin files for specific file types
"set shiftround      " When shifting lines, round the indentation to the nearest multiple of .shiftwidth..
"set expandtab       " tabs are converted to spaces, use only when required

" ============ Indentation Options ============ OFF
"set noautoindent
"set nosmartindent
"set nocindent

" ============ Search Options ============
set hlsearch         " highlight searches
set ignorecase       " ignore case when searching
set incsearch        " do incremental searching (shows partial matches)
set smartcase        " ...unless we type a capital
"set noignorecase    " don't ignore case

" ============ Performance Options ============
set complete=.,w,b,u,t,i        " set complete for ctags
set lazyredraw                  " Don.t update screen during macro and script execution.

" ============ Text Rendering Options ============
set display+=lastline           " Always try to show a paragraph.s last line.
"set encoding=utf-8             " Use an encoding that supports unicode.
"set linebreak                  " Avoid wrapping a line in the middle of a word.
"set nowrap                     " don't wrap lines
"set wrap                       " Enable line wrapping.  [new]

" ============ Scrolling  ============
set scrolloff=3                 " keep 3 lines when scrolling
"set sidescrolloff=5            " The number of screen columns to keep to the left and right of the cursor.

" ============ User Interface Options ============
"set laststatus=2               " Always display the status bar.
set ruler                       " show the cursor position all the time
set wildmenu                    " visual autocomplete for command menu
set cursorline                  " Highlight the line currently under cursor
set showmatch                   " highlight matching [{()}] show matching braces 'set sm'

set matchtime=5
set visualbell t_vb=            " turn off error beep/flash
set novisualbell                " turn off visual bell
"set noerrorbells               " Disable beep on errors.
"set mouse=a                    " Enable mouse for scrolling and resizing.
"set tabpagemax=50              " Maximum number of tab pages that can be opened from the command line.
"set relativenumber             " Show line number on the current line and relative numbers on other lines

set t_Co=256                   " for setting 256 color term
" set t_Co=16                     " fix for bg being too bright

if has("gui_running")
    " See ~/.gvimrc
    set guifont=Monospace\ 10   " use this font
    set lines=50                " height = 50 lines
    set columns=100             " width = 100 columns
    set background=dark         " adapt colors for background
    set selectmode=mouse,key,cmd
    set keymodel=
else
    set background=dark        " adapt colors for background
    colorscheme PlasticCodeWrap     " use this color scheme
    highlight Comment cterm=bold
endif

if &term != "builtin_gui"
    let &titleold=substitute(system("hostname"),'\(.*\)\n','\1','')
    set title                   " show title in console title bar
endif

let &titlestring = "--- " . hostname() . " ---" . "\ [vim (" . expand("%:p") . ")/ ]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif

if &term == "screen" || &term == "xterm" || &term == "xterm-256color"
  set title                   " show title in console title bar
endif

" ============ Code Folding Options ============
"set foldmethod=indent          " Fold based on indention levels.
"set foldnestmax=3              " Only fold up to three nested levels.
"set nofoldenable               " Disable folding by default.

" ============ Miscellaneous Options ============
"set autoread                   " Automatically re-read files if unmodified inside Vim.
set backspace=indent,eol,start  " Allow backspacing over indention, line breaks and insertion start.

" ============ Miscellaneous Options [NEW] ============
"set confirm                    " Display a confirmation dialog when closing an unsaved file.
"set backupdir=~/.cache/vim     " Directory to store backup files.
"set dir=~/.cache/vim           " Directory to store swap files.
"set formatoptions+=j           " Delete comment characters when joining lines.
"set hidden                     " Hide files in the background instead of closing them.
"set history=1000               " Increase the undo limit.
"set nomodeline                 " Ignore file.s mode lines; use vimrc configurations instead.
"set noswapfile                 " Disable swap files.
"set nrformats-=octal           " Interpret octal as decimal when incrementing numbers.
"set shell                      " The shell used to execute commands.
"set spell                      " Enable spellchecking.
"set wildignore+=.pyc,.swp      " Ignore files matching these patterns when opening files based on a glob pattern.


" ====== AutoConfg Group ============
augroup configgroup
    autocmd!
    " Remember last known cursor position
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
    autocmd Filetype python set ts=2 shiftwidth=2 expandtab

    autocmd BufNewFile,BufRead *.groovy  setf groovy
    autocmd FileType groovy source /bhsystematic/users/abrandeis/.vim/syntax/groovy.vim
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
augroup END

augroup statline_trail
    autocmd!
    autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
augroup END

" ============ Functions ============

function! ToggleMouse()
    if &mouse == ''
        let &mouse='a'
    else
        let &mouse=''
    endif
endfunction


" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
fun! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfun

fun! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
        return " [paste] "
    else
        return ""
    endif
endfun

" check if variable bg exists at all, and return it in a safe way (for status line)
fun! GetBG()
 if exists("&bg")|return &bg|else|return "-"|
 endif
endfun
" check is colorscheme name exists and return it
fun! GetCN()
 if exists("g:colors_name") | return g:colors_name | else | return "-" |
 endif
endfun

" ============ plugins ============

" SEE PLUGIN statline.vim at github
" https://github.com/millermedeiros/vim-statline/blob/master/plugin/statline.vim

" ====== Syntastic errors ====== integration is enabled by default

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if !exists('g:statline_syntastic')
    let g:statline_syntastic = 1
endif
if g:statline_syntastic
    set statusline+=\ %3*%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}%*
endif

" ====== custom errors ======

" based on @scrooloose whitespace flags
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html


" ====== mixed indenting ======

if !exists('g:statline_mixed_indent')
    let g:statline_mixed_indent = 1
endif

if !exists('g:statline_mixed_indent_string')
    let g:statline_mixed_indent_string = '[mix]'
endif

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatlineTabWarning()
    if !exists("b:statline_indent_warning")
        let b:statline_indent_warning = ''

        if !&modifiable
            return b:statline_indent_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statline_indent_warning = g:statline_mixed_indent_string
        elseif (spaces && !&et) || (tabs && &et)
            let b:statline_indent_warning = '[&et]'
        endif
    endif
    return b:statline_indent_warning
endfunction

if g:statline_mixed_indent
    set statusline+=%3*%{StatlineTabWarning()}%*

    " recalculate when idle and after writing
    augroup statline_indent
        autocmd!
        autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
    augroup END
endif

" commented out [332 to 347] due to viewing attr files delay opening
" ====== trailing white space ======
"if !exists('g:statline_trailing_space')
"    let g:statline_trailing_space = 1
"endif

"function! StatlineTrailingSpaceWarning()
"    if !exists("b:statline_trailing_space_warning")
"        if search('\s\+$', 'nw') != 0
"            let b:statline_trailing_space_warning = '[\s]'
"        else
"            let b:statline_trailing_space_warning = ''
"        endif
"    endif
"    return b:statline_trailing_space_warning
"endfunction


" update ctags:
" ctags -f ./tags -R ./ctagsfolder/
set tags=tags,./tags;/bhsystematic/users/abrandeis/.vim/tags/;  " Search current directory for tags, then up, finally root .vim

set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
            \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

" Keyboard mapping for numeric keypad
imap <Esc>OM <c-m>
 map <Esc>OM <c-m>
imap <Esc>OP <nop>
 map <Esc>OP <nop>
imap <Esc>OQ /
 map <Esc>OQ /
imap <Esc>OR *
 map <Esc>OR *
imap <Esc>OS -
 map <Esc>OS -

imap <Esc>Ol +
imap <Esc>Om -
imap <Esc>On ,
imap <Esc>Op 0
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Oz 0



"set statusline+=%{SyntasticStatuslineFlag()}  " Syntastic error flag
"BROKEN IN VIM72"
"if g:statline_trailing_space
"    set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*
"
"    " recalculate when idle, and after saving
"    augroup statline_trail
"        autocmd!
"        autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
"    augroup END
"endif

