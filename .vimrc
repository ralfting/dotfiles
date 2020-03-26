set nocompatible              " be iMproved, required

filetype on
filetype plugin indent on

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
" set relativenumber

autocmd FocusLost   * call NumberToggle()
autocmd FocusGained * call NumberToggle()
autocmd InsertEnter * call NumberToggle()
autocmd InsertLeave * call NumberToggle()

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

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

nnoremap tk :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tablast<CR>


" ESC in CAPS LOCK
imap <caps> <Esc>

syntax enable

filetype plugin indent on

" Set filetypes
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript
autocmd BufNewFile,BufRead *.js setlocal filetype=javascript
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript
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
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/node_modules                              " ctrlp - ignore node modules
set wildignore+=*node_modules                              " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build directory

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
"set modeline
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

" Common
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-js-file-import'
Plug 'w0ng/vim-hybrid'

" New stuffs
Plug 'wsdjeg/vim-fetch'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'easymotion/vim-easymotion'

Plug 'leshill/vim-json'
Plug 'scrooloose/nerdcommenter'

Plug 'Valloric/YouCompleteMe'

" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Search/navigation
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'

" End Plugins
call plug#end()

" Javascript
"let g:javascript_plugin_flow = 1
let g:hybrid_custom_term_colors = 0
let g:hybrid_reduced_contrast = 0
set background=dark
colorscheme hybrid


" Typescript
nnoremap <leader>g :TsuDefinition<CR>

"Vim js file import
nnoremap <Leader>j :ImportJSWord<cr>
nnoremap <Leader>i :ImportJSFix<cr>
nnoremap <Leader>] :YcmCompleter GoTo<CR>

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

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" MAPS
nnoremap <C-p> :Files<cr>
noremap <leader>pk :tabe package.json<cr>

" Navigation in splits tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Ag
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --ignore-dir ./node_modules -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Toggle copen / close
function! QuickFix_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor

  copen
endfunction

nnoremap <C-t> :call QuickFix_toggle()<cr>

" NedTree'
map <C-n> :NERDTreeToggle<CR>

" inoremap Ctrl + X Ctrl + O
" inoremap <C-Space> <C-x><C-o>
inoremap <C-O> <C-X><C-O>

" fugitive git bindings
nnoremap <space>gb :Gblame<CR><CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>go :Git checkout<Space>

" Back preview file
nnoremap <Leader>b  :e#<CR>

" statusline git
" set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%F

" NERDComment
let g:NERDSpaceDelims = 1

" YouCompleteMe
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_max_diagnostics_to_display = 0

" Ale
let g:ale_linters = {'javascript': ['eslint', 'flow']}
let g:ale_lint_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Easymotion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

