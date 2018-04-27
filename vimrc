" Map for moving through windows
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Binding nvim clipboard with system's clipboard
function! ClipboardYank()
  call system('xclip -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -selection clipboard -o')
endfunction

set clipboard=unnamed
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" Map leader + q to close buffer
map <leader>q <esc>:call CloseCurrentBuffer()<cr>
function! CloseCurrentBuffer()
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
  else
    bnext
  endif

  if (bufnr("%") == todelbufNr)
    new
  endif
  exe "bd".todelbufNr
endfunction

" Set tabs to 2 spaces
set tabstop=2
set softtabstop=0
set shiftwidth=2

" Set indent and numbers
set number
set numberwidth=5
set smartindent

" Set virtualedit
set virtualedit=all

" Map moving-keys for sugestions/completions in insert-mode
imap <c-k> <c-p>
imap <c-j> <c-n>

" Map ; to : in normal and visual mode
nnoremap ; :
vmap ; :

" Map leader to space
let mapleader=" "

" Map reload vimrc
nmap <leader>so :so ~/.vimrc<cr> 
" Map edit vimrc
nmap <leader>rr :edit ~/.onhernandes/dotfiles/vimrc<cr>

" Map horizontal and vertical split of the same file
nmap <leader>s :split %<cr>
nmap <leader>vs :vsplit %<cr>

" Set new windows position
set splitright " Split new vertical windows right of current window .
set splitbelow " Split new horizontal windows under current window.

" Set UltiSnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Begin vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'shime/vim-livedown'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" End vim-plug
call plug#end()

" DO NOT USE THESE FUCKING ARROWS. THANKS.
noremap <Up> ""
noremap! <Up> <Esc>
noremap <Down> ""
noremap! <Down> <Esc>
noremap <Left> ""
noremap! <Left> <Esc>
noremap <Right> ""             
noremap! <Right> <Esc>             
