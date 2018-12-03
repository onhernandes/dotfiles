" Map leader to space
let mapleader=" "  

" Map for moving through windows
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Binding nvim clipboard with system's clipboard using xclip
function! ClipboardYank()
  call system('xclip -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -selection clipboard -o')
endfunction

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
 
" Map moving-keys for sugestions/completions in insert-mode
imap <c-k> <c-p>
imap <c-j> <c-n>

" Map ; to : in normal and visual mode
nnoremap ; :
vmap ; :

" Map reload and edit for vimrc
nmap <leader>so :so $HOME/.vimrc<cr> 
nmap <leader>rr :edit $HOME/.onhernandes/dotfiles/vimrc<cr>
nmap <leader>rm :edit $HOME/.onhernandes/dotfiles/vim/mappings.vim<cr>
nmap <leader>rp :edit $HOME/.onhernandes/dotfiles/vim/plugins.vim<cr>

" Map :Files
nmap <leader>f :Files<cr>

" Bubble single lines to CTRL + ALT + j
nmap  <c-a-j> ]e
nmap  <c-a-k> [e

" Bubble multiple lines to CTRL + ALT + j
vmap <c-a-k> [egv
vmap <c-a-j> ]egv

" leader + space clear highlight
nmap <silent> <leader><space> :silent noh<cr>

" Simpler folding
nnoremap zr zR
nnoremap zm zM

" Make the fold that we're currently in the only fold showing; collapse all
" other folds. Mnemonic: "z This"
nnoremap <silent> zt zMzvzczO

" jj to <esc>
inoremap jj <esc>

" <tab> indent
map <tab> >gv
map <s-tab> <gv
nmap <tab> >>
nmap <s-tab> <<

" Map leader save
nmap <leader>w :w!<cr>

" Map next and previous buffer
nmap <leader>l :bn<cr>
nmap <leader>h :bp<cr>

" Map resize horizontal splits
nmap <leader>j :res -1<cr>
nmap <leader>k :res +1<cr>

" Map :Buffers
nnoremap <leader>b :Buffers<cr>

" Map horizontal and vertical split of the same file
nmap <leader>s :split %<cr>
nmap <leader>vs :vsplit %<cr>

" Map S to s for surround plugin
vmap s S

" DO NOT USE THESE FUCKING ARROWS. THANKS.
noremap <Up> ""
noremap! <Up> <Esc>
noremap <Down> ""
noremap! <Down> <Esc>
noremap <Left> ""
noremap! <Left> <Esc>
noremap <Right> ""             
noremap! <Right> <Esc>   

" Abbreviations
iabbrev lenght length
iabbrev widht width
iabbrev assing assign
