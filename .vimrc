set nocompatible

syntax on
syntax enable

filetype on
filetype plugin indent on

let mapleader=','

" ================ General Config ====================

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

autocmd BufWritePre * %s/\s\+$//e

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

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

  set grepprg=rg\ --vimgrep

  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

  " Rg current worda
  nnoremap <leader>fw :Rg <C-R><C-W><space> <CR>

  " Rg
  nnoremap \ :Rg <C-R><space>
endif

" set relativenumber
autocmd FocusLost   * call NumberToggle()
autocmd FocusGained * call NumberToggle()
autocmd InsertEnter * call NumberToggle()
autocmd InsertLeave * call NumberToggle()

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" nerd tree
nmap <silent> <C-b> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTree"
  endif
endfunction

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

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

set viminfo+=! " make sure vim history works
set wmh=0 " reduces splits to a single line

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
set shortmess=atI
" Show the current mode
set title

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

" Tab navigation
nnoremap tf :tabfirst<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tl :tablast<CR>

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
nnoremap <leader><space> :nohlsearch<CR>

" ===================================================

" Navigation in splits tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Display tabs and trailing spaces visually
set list
set listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

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

nnoremap <Leader>b  :e#<CR>

call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'w0ng/vim-hybrid'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'easymotion/vim-easymotion'

  Plug 'tpope/vim-surround'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-eunuch'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'vim-test/vim-test'

  "Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'

  " Elixir
  Plug 'elixir-editors/vim-elixir' " Syntax highlighting, Filetype detection, Automatic indentation
  Plug 'mhinz/vim-mix-format' " Run mix formatter asynchronously (:MixFormat, :verb MixFormat, :MixFormatDiff)
  Plug 'slashmili/alchemist.vim' " Completion for Modules and functions, and much more...
  Plug 'neomake/neomake' " Execute code checks to find mistakes in the currently edited file
  Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
call plug#end()

" COC
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Javascript
let g:hybrid_custom_term_colors = 0
let g:hybrid_reduced_contrast = 0
set background=dark
colorscheme hybrid

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Tags
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

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

let g:user_emmet_leader_key='<C-Z>'

" Set toggle paste
set pastetoggle=<F3>

" Vim Test Configurations
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

" VM
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_highlight_matches = 'underline'

let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

" Mix Format

let g:mix_format_on_save = 1

nnoremap <leader>mf :MixFormat<cr>
nnoremap <leader>mfv :verb MixFormat<cr>
nnoremap <leader>mfd :MixFormatDiff<cr>


