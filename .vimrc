" bundles
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype plugin on
filetype plugin indent on

colorscheme molokai

set noic
set softtabstop=4
set expandtab
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
		  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
		          "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nobackup
set noswapfile
set pastetoggle=<F2>
set nocompatible
let loaded_project = 1

set ruler         " Muestra posición y otros datos del cursors y el buffer.
"set completeopt=menu,longest,preview "mejora el autocompletado
set wildmenu " turn on wild menu
set wildmode=list:longest " turn on wild menu in special format (long format)
"set wildignore=*.pyc,*.pyo,*.dll,*.o,*.obj,*.bak,*.exe,*.swo,*.swp,*.jpg,*.gif,*.png " ignore some formats


"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

set lazyredraw " do not redraw while running macros (much faster) (LazyRedraw)
set vb " blink instead beep

set makeprg=python2\ manage.py\ validate " django stuff

set cmdheight=2 " silent shell prompts

" nerdtree commentor
map <Leader>c ,c
map <Leader>e <C-e>

" toggle NERDTree
map <F4> :NERDTreeToggle<CR>

"toggle Taglist
map <F3> :TlistToggle<CR>

" toggle fugitive status
map <silent><leader>s :Gstatus<CR>
" toggle fugitive diff
map <silent><leader>d :Gdiff<CR>

" change escpae
:inoremap <C-leader> <Esc>

" ignore python cruft
let NERDTreeIgnore=['\.pyc']
set wildignore=*.py[co]

" insert newline but dont enter insert mode
map <silent><leader><Enter> o<Esc>k

"Delimitmate
au FileType * let b:delimitMate_autoclose = 1

" If using html auto complete (complete closing tag)
au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"

" python ctags
set tags+=$HOME/.vim/tags/python.ctags

" tabbing
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
map <silent><A-x> :tabclose<CR>

" auto nerd tree
autocmd VimEnter * NERDTree

" clear search highlight
nnoremap <C-space> :noh<cr>

" clipboard
set clipboard="+

" shortcuts
nnoremap ; :

" vimango
let vimango_app_prefix = '~/Programacion/tutoriales/mysite/'
let vimango_template_prefix = '~/Programacion/tutoriales/mysite/templates/'

:set hidden

let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1

" clear ^M messup
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"comente esto----<
"Omnicomplete
"autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let $DJANGO_SETTINGS_MODULE='mysite.settings'

set gfn=Inconsolata\ Medium\ 13
"set gfn=Monaco\ 12

set tags+=/home/poncho/.tags/
set path+=new_templates,templates,apps
let g:closetag_default_xml=1

" open gf in new tab
:nnoremap gf <C-W>gf

"map Command-T
nmap <C-t> :CommandT<CR>


"new tab
map <leader>t :tabnew<CR>
set includeexpr=substitute(v:fname,'\\.','/','g')
set suffixesadd=.py
"nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Visual indent after paste
nnoremap gp "+gP`[V`]=
nnoremap p p`[V`]=
let g:sparkupNextMapping = '<c-h>'

"noremap^M<Up><Up><Down><Down><Left><Right><Left><Right>ba :botright !figlet "Vim    FTW"<CR>
map <leader>gp :%vimgrep <cword> **/*.py<CR>
map <leader>gh :%vimgrep <cword> **/*.html<CR>

" Conque shell
map <leader>e :ConqueTermSplit python2<CR>
map <F6> :ConqueTermSplit bash<CR>

" prevent cursor jumping in v-mode
vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>

" remove trailing whitespace
map <leader>w :FixWhitespace<CR>

"copy
vmap <F8> "+ygv"zy`>
"paste (Shift-F8 to paste after normal cursor, Ctrl-F8 to paste over visual selection)
nmap <F8> "zgP
nmap <S-F8> "zgp
imap <F8> <C-r><C-o>z
vmap <C-F8> "zp`]
cmap <F8> <C-r><C-o>z
"copy register
autocmd FocusGained * let @z=@+


"Comente estos <--------
" this causes problems with taglist
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" quicker trans tags around selection
"let g:surround_{char2nr("t")} = "{% trans \"\r\" %}"
"let g:surround_{char2nr("l")} = "{% blocktrans %}\r{% endblocktrans %}"
"nmap <F11> viwSt
"nmap <F12> vitSl

" stealing tpope's statusline
set statusline=[%n]%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python2 % <CR>

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
	if has('gui_running')
		set guioptions-=T          	" remove the toolbar
		set lines=40                "40 lines of text instead of 24,0
		set guioptions-=m
	else
		set term=builtin_ansi       " Make arrow and other keys work
	endif
" }
