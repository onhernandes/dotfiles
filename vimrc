set clipboard=unnamed

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

set tabstop=2
set softtabstop=0
set shiftwidth=2

set number
set numberwidth=5
set smartindent

set virtualedit=all

imap <c-k> <c-p>
imap <c-j> <c-n>
nnoremap ; :

let mapleader=" "

nmap <leader>so :so ~/.vimrc<cr> 
nmap <leader>rr :edit ~/.onhernandes/dotfiles/vimrc<cr>
nmap <leader>s :split %<cr>
nmap <leader>vs :vsplit %<cr>
set splitright " Split new vertical windows right of current window .
set splitbelow " Split new horizontal windows under current window.

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

noremap <Up> ""
 noremap! <Up> <Esc>
 noremap <Down> ""
 noremap! <Down> <Esc>
 noremap <Left> ""
 noremap! <Left> <Esc>
 noremap <Right> ""             
