
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on

" Look / Behavior
set guifont=Courier_new:h10:cANSI
colorscheme jellybeans
set bg=dark
set smartcase
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set number
set cmdheight=1
set nowrap
set colorcolumn=80
set ruler
set shiftround " sr
set cindent " cin
set copyindent " ci
set preserveindent "pi
set hlsearch
" No annoying sound on errors
set noerrorbells
set novisualbell
set belloff=all
set showmatch
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" How many tenths of a second to blink when matching brackets
set mat=2
set incsearch
"set wildignorecase
set wildmenu
" Ignore files
set wildignore=*.o,*~,*.pyc,*.swp
" Set to auto read when a file is changed from the outside
"set autoread
highlight MatchParen ctermbg=2
set relativenumber

" gvim
if has("gui_running")
   if has('win32')
      set go-=m " Remove menubar
      set go-=T " Remove toolbar
      set go-=r " Remove scrollbar
      set go-=L " Remove scrollbar

      " Turn off italicized comments
      hi Comment gui=None
   endif
else " terminal
   "set clipboard=exclude=:.* " research this
   set t_Co=256
endif

if &term == "screen"
   set t_Co=256
endif

" Mappings
" Edit vimrc ,ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>
nnoremap <silent> <Leader>et :tabnew<CR>:e ~/.tmux.conf<CR>

nnoremap <silent> <Leader>s :tabe<CR>:Ex<CR>
nnoremap <silent> <Leader>f :tabe %<CR>:Ex<CR>

nnoremap <silent> <Leader>b :bd<CR>

nnoremap <silent> <Leader>q :qa<CR>
nnoremap <silent> <Leader>w :w<CR>

" ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" These make it so going to the next match in a search will center the buffer
" on the line the match is found in
map N Nzz
map n nzz

" Diffmode mappings
nnoremap <expr> <C-J> &diff ? 'do]czz' : '<C-J>'
nnoremap <expr> <C-K> &diff ? 'do[czz' : '<C-K>'

" Auto commands
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" lets
let g:netrw_banner=0

"______________________________RESEARCH_____________________________"
set backspace=2
set enc=utf8
set nohidden

