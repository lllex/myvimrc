" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

source $VIMRUNTIME/vimrc_example.vim

"==============================================================================
"pathogen

filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

"==============================================================================
"fileextensions - filetype syntax

if has("autocmd")
    au BufNewFile,BufRead *.pro set filetype=qmake
    au BufNewFile,BufRead *.pri set filetype=qmake
    au BufNewFile,BufRead *.prf set filetype=qmake
    au BufNewFile,BufRead *.proto set filetype=proto

    "au BufNewFile,BufRead *     IndentGuidesDisable
    "au BufNewFile,BufRead *.xml IndentGuidesEnable
    au BufLeave *     IndentGuidesDisable
    au BufEnter *.xml IndentGuidesEnable
endif 

"==============================================================================

" имитация win комбинация(Ctrl+C, Ctrl+V и тд тп)
"source $VIMRUNTIME/mswin.vim
"behave mswin

"==============================================================================
" общие:

" repeat comment on newline
set fo-=ro
au FileType * set fo-=ro
set nocompatible
"backup off
set nowritebackup
set nobackup
" workdir at open file
"set autochdir 
"enc by default
set termencoding=utf-8
set novisualbell
"set iskeyword=@,48-57,_,192-255

" C-d - дублирование текущей строки
imap <C-d> <esc>yypi

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

"фолдинг(сворачивание блоков кода) по отсупам
"set foldmethod=indent

"==============================================================================
" enc	- текущая
" tenc	- отображение (termencoding)
" fenc	- кодировка сохранения

set fileencoding=utf-8

"формат перевода строки (unix, dos, mac)
set fileformat=unix

"==============================================================================
" установить режим отображения спец-символов:

"set list
" eol:<символ_конца_строки> 21b2
" tab:<начальный_символ_табуляции><последующие_символы_табуляции> 2192
" trail:<сивол_пробела_в_конце_строки> 00b7
" nbsp:<символ_неразрывного_пробела>   2194
" установить спец-символы(ctrl+v, u, код)
set listchars=eol:↲,tab:→→,trail:·,nbsp:↔

"==============================================================================
"scrolling:

" by line
map <C-Up>   <C-y>
map <C-Down> <C-e>

"==============================================================================
"search

set hlsearch		" highlight search results
set incsearch		" Incremental search
set ignorecase   	" при поиске игнорировать регистр (~set ic)
nnoremap * *Nzz     " only highlight 
nnoremap n nzz
nnoremap N Nzz

"==============================================================================
" tabs

set shiftwidth=4   "spaces when '>>'
set softtabstop=4  "spaces when 'tab'
set tabstop=4      "spaces in 'tab'
" smartmove tab (cindent)
set smartindent
set expandtab      "convert tabs to spaces

"==============================================================================
" visual
colorscheme mydesert "theme
"colorscheme wombat256mod

"==============================================================================

"не переносить длинные строки при отображении
set nowrap
"нумерация строк
set number 
"подсветка активной линии файла
set cursorline
"не выгружать буфер при переходе на другой файл
set hidden
"cкрыть панель в gui версии
set guioptions-=T
"формат и цвет строки состояния
set statusline=%f%m%r%h%w\ \[%{&ff}\,%{&encoding}\]\ \[%04l,%04v\]\ \[%p%%\]\ \[Len=%L\]\ %y\ %<
hi StatusLine   ctermfg=DarkBlue guibg=#f0e68c 
"всегда показывать статусную строку
set laststatus=2

"==============================================================================
" windows tabs(depend on terminal)

"Ctrl+tab: tab change: rigth --> left
"imap  <C-Tab> <Esc> :tabnext <CR>i
"map   <C-Tab> :tabnext <CR>
"noremap <C-tab> :tabnext<CR>
"Ctrl+Shift+tab: tab change: left --> rigth 
"imap  <C-S-tab> <Esc> :tabprev <CR>i
"map   <C-S-tab> :tabprev <CR>
"Ctrl+W: cur tab close
"imap <C-W> <Esc> :tabclo <CR>i
"map  <C-W> :tabclo <CR>

"==============================================================================
" <F>

"F1 tagbar win " see Tagbar
noremap  <F1> <esc>:TagbarToggle<cr> 
"F2 save:
imap <F2> <Esc>:w<CR>
map  <F2> <Esc>:w<CR>
"F3 on/off search results
nmap <F3> :nohlsearch<CR>
imap <F3> <Esc>:nohlsearch<CR>
vmap <F3> <Esc>:nohlsearch<CR>gv
"F4 next error [!] \TODO нужно научиться игнорировать warnings
nmap <F4> :cnext<cr>
vmap <F4> <esc>:cnext<cr>
imap <F4> <esc>:cnext<cr>
"F5 shell call
map <F5> :sh<CR>
"F6 toggle error window
"
"F8 - список закладок
map  <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" Taglist
"map  <F11> :TlistToggle<cr>
"vmap <F11> <esc>:TlistToggle<cr>
"imap <F11> <esc>:TlistToggle<cr>

"F12 encoding menu
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
menu Encoding.cp1251  :e ++enc=cp1251<CR>
menu Encoding.utf-8   :e ++enc=utf-8<CR>
menu Encoding.cp866   :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
map <F12> :emenu Encoding.<Tab>

"==============================================================================
" vim command when Ru

" Russian language keyboard mappings (UTF-8)
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"==============================================================================
"taglist

"-------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for make
" taglist.vim : define the title texts for qmake
"-------------------------------------------------------------------
"noremap  <silent> <F4>  <Esc><Esc>:Tlist<CR>
"inoremap <silent> <F4>  <Esc><Esc>:Tlist<CR>

let tlist_make_settings  = 'make;m:makros;t:targets;i:includes'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

"==============================================================================
" diff func

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"==============================================================================
" improve word-complete by tab 

function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
    endif
endfunction

imap <tab> <c-r>=InsertTabWrapper()<cr>

"==============================================================================
" cursor color

"if &term =~ "xterm"
"    :silent !echo -ne "\033]12;Khaki\007"
"    let &t_SI = "\033]12;green\007"
"    let &t_EI = "\033]12;Khaki\007"
"    autocmd VimLeave * :!echo -ne "\033]12;yellow\007"
"end

"==============================================================================
"Tagbar

" let g:tagbar_ctags_bin = 'C:\Ctags5.8\ctags.exe'
let g:tagbar_left      = 1
let g:tagbar_width     = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
"let g:tagbar_sort     = 0 " default=1
let g:tagbar_compact   = 1

"==============================================================================
"vim-sessions
let g:session_autoload = 'no' "предлагать загрузить default session
"let g:session_directory = './.vim/sessions' " [!] off-mkdir always

"==============================================================================
" Omni completion

" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=./.vim/tags/tags
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt.ctags

" " build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" " OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"popu menu color
highlight Pmenu guibg=gray16
"все цвета: http://vim.wikia.com/wiki/VimTip634
"highlight Pmenu guibg=gray16 gui=brown
"highlight Pmenu guibg=DimGray gui=brown     "серый
"highlight Pmenu guibg=DarkOrchid2 gui=brown "фиолетовый фон

"==============================================================================
" highlighting
" Add highlighting for function definition in C++ (+ some my colors)

function! EnhanceCppSyntax()
   
	"my color for cpp + desert:   
	hi PreProc  ctermfg=green
	hi Constant ctermfg=12
	hi Type term=bold cterm=bold ctermfg=222 gui=bold guifg=khaki
	syn keyword Type namespace for vector string new class const emit private
	syn keyword Function main

	"TagHighlighting:
	hi Class  ctermfg=223
	hi link Structure Class
	hi link Union Class

	hi link DefinedName PreProc

	hi Function ctermfg=214

	hi EnumerationValue ctermfg=13
	hi link EnumerationName	Type
	hi Constant  ctermfg=12
	"hi LocalVariable
	hi link Member Normal
	hi Namespace ctermfg=yellow
	hi GlobalVariable ctermfg=blue
	hi Extern ctermfg=159
	"hi File ctermfg=blue
	hi CTagsFunction ctermfg=214
	
	"regex match:
	"hi cCustomFunc  ctermfg=214
	"hi link cCustomClass Type ClassName::
    "hi link cCustomScope Type
	
	"easy tags:
    "hi link cFunctionTag cCustomFunc
endfunction

"autocmd Syntax cpp,vim,qmake,cmake call EnhanceCppSyntax()
autocmd Syntax * call EnhanceCppSyntax()

"----------------------------------
"colors
"
"autocmd BufEnter *.h source ~/.vim/colors/vim_hi.vim
"autocmd BufEnter *.cpp source ~/.vim/colors/vim_hi.vim
"
"Keyword ctermfg=251 
"hi Identifier ctermfg=120
"hi Class ctermfg=229
"hi Command ctermfg=218
"hi DefinedName ctermfg=222
"hi Entity ctermfg=189
"hi Domain ctermfg=117
"hi Extern ctermfg=82
"hi Interface ctermfg=81
"hi EnumerationName ctermfg=166
"hi EnumerationValue ctermfg=214
"hi EnumeratorName ctermfg=208
"----------------------------------

"==============================================================================
" TagHighlighting

if ! exists('g:TagHighlightSettings')
	let g:TagHighlightSettings = {}
endif

let g:TagHighlightSettings['TagFileName'] = 'tags.taghl'
let g:TagHighlightSettings['DoNotGenerateTags'] = '0'

"let g:TagHighlightSettings['DirModeSearchWildcards'] = ".vim"
"let g:TagHighlightSettings['DefaultDirModePriority'] = 'Explicit'
"let g:TagHighlightSettings['TagFileName'] = 'tags' " <--work
"let g:TagHighlightSettings['PostReadHooks'] = [ 'EnhanceCppSyntax' ]   
"let g:TagHighlightSettings['PostUpdateHooks'] = [ 'EnhanceCppSyntax' ]   

"let g:TagHighlightSettings['ProjectConfigDirModePriority'] = '.vim' "proj
"let g:TagHighlightSettings['TagFileDirModePriority'] = ".vim"			"tag file
"let g:TagHighlightSettings['TypesFileDirModePriority' ] = ".vim"			"types file


"==============================================================================
" debug: [gdb|C/C++|Pyclewn]

let g:pyclewn_args='--gdb=../../.vim/gdbsession --window=bottom'

" debug on        -> :Pyclewn, :Cmapkeys, :Cfile ../../bin/PROJ_NAME, Ccd, Cstart
map <C-F10> <esc>:Pyclewn<cr>:Cmapkeys<cr>
" debug off       -> :nbclose, :Cunmapkeys
map <C-F11> <esc>:Cunmapkeys<cr>:nbclose<cr>
" watch win
map <C-F9>	<esc>:Cdbgvar<cr>

"Ccwindow		" open q-breaks end move
"how simbol on cursor
":map <F8> :exe "Cprint " . expand("<cword>") <CR> 
"C-P, C-x

"==============================================================================
" make

map <C-F5> <esc>:wa<cr>:make! \| :copen<cr>

"==============================================================================
" FuzzyFinder

let g:fuf_modesDisable = [ 'mrucmd' ]

map <Leader>l <esc>:FufLine<cr>
map <Leader>b <esc>:FufBuffer<cr>
map <Leader>t <esc>:FufTag<cr>
map <Leader>q <esc>:FufQuickfix<cr>
map <Leader>m <esc>:FufMruFile<cr>
map <Leader>f <esc>:FufFile<cr>

"==============================================================================
" ManView

fun! ReadMan()
	" Assign current word under cursor to a script variable:
	let s:man_word = expand('<cword>')
	" Open a new window:
	:exe ":wincmd n"
	" Read in the manpage for man_word (col -b is for formatting):
	:exe ":r!man " . s:man_word . " | col -b"
	" Goto first line...
	:exe ":goto"
	" and delete it:
	:exe ":delete"
	" finally set file type to 'man':
	:exe ":set filetype=man"
endfun

" Map the K key to the ReadMan function:
"map K :call ReadMan()<CR>

"TODO: проблемы с незакрывающися readonly буфером

"==============================================================================
" indent-guides

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=7

let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1

"==============================================================================
" folding
"xml

function! SetXmlFolding()
    let l:curLine = getline(v:lnum)
    echo "line = " l::curLine
    let l:foldLvl = foldlevel() == -1 ? 1 : foldlevel()
    if     l:curLine =~ '\s*<n .*/>'
        return "0"
    elseif l:curLine =~ '\s*<n .*>'
        return ">".string(l:foldLvl)
    elseif l:curLine =~ '\s*</n>'
        return "<".string(l:foldLvl)
    return "0"
endfunction

"for debug: set foldcolumn=10
"setlocal foldmethod=expr
"setlocal foldexpr=SetXmlFolding()

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"==============================================================================
" a.vim: .cpp <--> .h

"au FileType cpp setlocal foldmethod=syntax
map <C-A> <esc>:A<cr>

"default if .h(existed) -> create .cpp(not .c)
" call <SID>AddAlternateExtensionMapping('h',"c,cpp,cxx,cc,CC")
let g:alternateExtensions_h = "cpp,c,cxx,cc,CC"

"==============================================================================
" python-mode

let g:pymode_lint_write = 0 "не проверять при каждом сохранении, можно юзать
"PyLint

let g:pymode_folding = 0 
let g:pymode_rope_vim_completion = 0 "не использовать автодополнение rope

" K - doc, \r - запустить

"==============================================================================
" pydirection

let g:pydiction_location = '/home/lex/.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 5 " complete list len

"==============================================================================

