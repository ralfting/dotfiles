set nocompatible              " be iMproved, required
filetype on
filetype plugin on
" ================ General Config ====================

let mapleader=','
scriptencoding utf-8          " utf-8 all the way
set encoding=utf-8
set number               "Line numbers are good
set splitbelow
set splitright
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set mouse-=a                    "Disable mouse click
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set cursorline                  " Set line on cursor
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set guifont=Inconsolata\ XL:h14,Inconsolata:h15,Monaco:17,Monospace
setl nu
set relativenumber

autocmd FocusLost   * call NumberToggle()
autocmd FocusGained * call NumberToggle()
autocmd InsertEnter * call NumberToggle()
autocmd InsertLeave * call NumberToggle()

"Execute file
autocmd FileType javascript nmap <Leader>r :!node %<cr>
autocmd FileType ruby nmap <Leader>r :!ruby %<cr>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

"========== =============================

syntax on

" Disable arrows
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Disable mouse scroll wheel
:nmap <ScrollWheelUp> <nop>
:nmap <S-ScrollWheelUp> <nop>
:nmap <C-ScrollWheelUp> <nop>
:nmap <ScrollWheelDown> <nop>
:nmap <S-ScrollWheelDown> <nop>
:nmap <C-ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>

" Open Files
map <space>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <space>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <space>v :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <space>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <space>r :r <C-R>=expand("%:p:h") . "/" <CR>


" ESC in CAPS LOCK
imap <caps> <Esc>

syntax enable

filetype plugin indent on

" Set filetypes
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript
autocmd BufNewFile,BufRead *.rb setlocal filetype=ruby
autocmd BufNewFile,BufRead *.scss setlocal filetype=sass

set hidden
" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list
set listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=7         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...

" ================ Normal mode mappings ====================

nnoremap <leader><space> :nohlsearch<CR>

" Add g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

set viminfo+=! " make sure vim history works
set wmh=0 " reduces splits to a single line

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Always show status line
set laststatus=2
" Respect modeline in files
set modeline
set modelines=4
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
"set shortmess=atI
" Show the current mode
set title


" Start Plugins
call plug#begin('~/.vim/plugged')
" Theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'w0rp/ale'
Plug 'kristijanhusak/vim-js-file-import'
Plug 'jiangmiao/auto-pairs'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'

Plug 'leshill/vim-json'
Plug 'editorconfig/editorconfig-vim'


" End Plugins
call plug#end()

" Javascript
let g:javascript_plugin_flow = 1

" Theme
syntax on
let g:hybrid_custom_term_colors = 0
let g:hybrid_reduced_contrast = 0
set background=dark
colorscheme hybrid

" Ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

"Vim js file import
nnoremap <Leader>j :ImportJSWord<cr>
nnoremap <Leader>i :ImportJSFix<cr>
nnoremap <Leader>g :ImportJSGoto<cr>

let g:js_file_import_sort_after_insert = 1

" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" MAPS
" nnoremap <leader>f :Find<cr>
nnoremap <C-p> :Files<cr>
nnoremap <leader>gs :Files src<cr>
nnoremap <leader>gc :Files src/styles<cr>
nnoremap <leader>n :ALENext<cr>
nnoremap <leader>pk :tabe package.json<cr>
