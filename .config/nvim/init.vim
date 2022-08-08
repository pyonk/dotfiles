"dein Scripts-----------------------------
"
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml_dir = expand('~/.config/nvim/dein')
  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/html.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/rust.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/go.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/terraform.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/markdown.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/toml.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/colorscheme.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/denops.toml', {'lazy': 0})

  " Required:
  call dein#end()
  call dein#call_hook('source')
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set termguicolors
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set smartindent
set listchars=tab:»-,trail:-,eol:¬,extends:»,precedes:«,nbsp:%
set diffopt+=vertical
set synmaxcol=320
set noshowmode
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Map leader to ,
let mapleader=','
" let mapleader="\<Space>"

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber
set signcolumn=yes
set mousemodel=popup

set t_Co=256
set guioptions=egmrti

set list

" colorscheme default

"" Buffer nav
noremap <Leader>bp :bp<CR>
noremap <Leader>bn :bn<CR>

"" Close buffer
noremap <Leader>bd :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <Leader>sc :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" html
autocmd Filetype html setlocal ts=4 sw=4 expandtab

" markdown
autocmd Filetype markdown setlocal ts=2 sw=2

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

augroup vimrc-typescript
  autocmd!
  autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

augroup vimrc-vue
  autocmd!
  autocmd FileType vue setlocal expandtab shiftwidth=2 tabstop=2
      \ formatoptions+=cq softtabstop=2
augroup END

" json
augroup vimrc-json
  autocmd!
  autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
      \ formatoptions+=cq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" クォーテーション関連
nnoremap <Leader>q" ciw""<ESC>P
nnoremap <Leader>q' ciw''<ESC>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" term
tnoremap <Esc> <C-\><C-n>

" 保存してなくてもbufferの切り替えの許可
set hidden

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> ss :split<CR>
nnoremap <silent> sv :vsplit<CR>

set splitbelow
set splitright

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set t_ZH=^[[3m
set t_ZR=^[[23m

source ~/.config/nvim/statusline.vim

" autocmd VimEnter * call dein#call_hook('post_source')

set colorcolumn=88
set cursorline

set updatetime=400

function! s:same_indent(dir) abort
  let lnum = line('.')
  let width = col('.') <= 1 ? 0 : strdisplaywidth(matchstr(getline(lnum)[: col('.')-2], '^\s*'))
  while 1 <= lnum && lnum <= line('$')
    let lnum += (a:dir ==# '+' ? 1 : -1)
    let line = getline(lnum)
    if width >= strdisplaywidth(matchstr(line, '^\s*')) && line =~# '^\s*\S'
      break
    endif
  endwhile
  return abs(line('.') - lnum) . a:dir
endfunction
nnoremap <expr><silent> sj <SID>same_indent('+')
nnoremap <expr><silent> sk <SID>same_indent('-')
onoremap <expr><silent> sj <SID>same_indent('+')
onoremap <expr><silent> sk <SID>same_indent('-')
xnoremap <expr><silent> sj <SID>same_indent('+')
xnoremap <expr><silent> sk <SID>same_indent('-')

" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" hi Normal ctermbg=NONE guibg=NON
" hi Normal ctermbg=NONE guibg=NON

" Live Substitution
set inccommand=nosplit

