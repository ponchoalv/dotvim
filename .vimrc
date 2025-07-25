" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completition for all file-related  tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
" set wildmode=list:longest,full " turn on wild menu in special format (long format)

" turn on wild menu in popup format
set wildoptions=pum

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" SET LEADER KEY:
let mapleader = ","

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^[ to jump to tag under cursor
" - Use g^ for ambiguous tags
" - Use ^t to jump back up the tag stack

"   THIGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:

" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
" set makeprg=golangci-lint\ run
" we don't need those guys... just create a simple makefile with
" the target we want to use and callit :make <target>

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


"" set up to us RipGrep - rg
if executable('rg')
  set grepprg=rg\ -H\ --no-heading\ --vimgrep\ --follow\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" INDENT STUFF:

set autoindent smartindent expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab

" MICELLANEOUS:

set mouse=a
set hlsearch
set incsearch
set number
set rnu
set numberwidth=4
set ruler
set clipboard=autoselect
set cursorline
set foldmethod=syntax
set ic
set showmatch
colorscheme sorbet

" store backup, undo, and swap files in tmp directory
set directory=$HOME/tmp//
set backupdir=$HOME/tmp//
set undodir=$HOME/tmp//
set backspace=indent,eol,start
set shortmess-=S
set rtp+=/opt/homebrew/bin/fzf
set hidden

" LSP stuff
packadd lsp

" Clangd language server
call LspAddServer([#{
    \    name: 'clangd',
    \    filetype: ['c', 'cpp'],
    \    path: '/usr/bin/clangd',
    \    args: ['--background-index']
    \  }])

" terraform-ls
call LspAddServer([#{
    \    name: 'terraform-ls',
    \    filetype: ['terraform'],
    \    path: '/opt/homebrew/bin/terraform-ls',
    \    args: ['serve']
    \  }])

" gopls
call LspAddServer([#{name: 'gopls',
    \   filetype: 'go',
    \   path: '/opt/homebrew/bin/gopls',
    \   args: ['serve']
    \ }])

" helm-ls
call LspAddServer([#{name: 'helm-ls',
    \    filetype: ['yaml', 'helm'],
    \    path: '/opt/homebrew/bin/helm_ls',
    \    args: ['serve']
    \  }])

" Typescript
call LspAddServer([#{name: 'typescript-language-server',
    \    filetype: ['typescript', 'javascript', 'typescriptreact', 'javascriptreact'],
    \    path: '/opt/homebrew/bin/typescript-language-server',
    \    args: ['--stdio']
    \  }])

" Copilot
packadd copilot

" LSP mappings
nnoremap <silent> gd <cmd>:LspGotoDefinition<CR>
nnoremap <silent> gD <cmd>:LspGotoDeclaration<CR>
nnoremap <silent> gr <cmd>:LspShowReferences<CR>
nnoremap <silent> gi <cmd>:LspGotoImplementation<CR>
nnoremap <silent> K <cmd>:LspHover<CR>
nnoremap <silent> <leader>cr <cmd>:LspRename<CR>
nnoremap <silent> <leader>ca <cmd>:LspCodeAction<CR>
nnoremap <silent> <leader>cf <cmd>:LspFormat<CR>
nnoremap <silent> <leader>cd <cmd>:LspDiag<CR>
nnoremap <silent> <leader>cl <cmd>:LspDiagLine<CR>
nnoremap <silent> <leader>cp <cmd>:LspDiagPrev<CR>
nnoremap <silent> <leader>cn <cmd>:LspDiagNext<CR>

