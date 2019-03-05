call plug#begin('~/.local/share/nvim/plugged')


""" NeoVim Completion Manager {{{
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-tern', {'do': 'npm install', 'for': ['vue', 'javascript']}
  Plug 'ncm2/ncm2-jedi', {'for': 'python'}
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-vim'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-markdown-subscope', {'for': 'markdown'}
  Plug 'ncm2/ncm2-html-subscope', {'for': ['html', 'html.mustache', 'html.handlebars']}
  Plug 'ncm2/ncm2-cssomni', {'for': ['css', 'sass', 'scss']}

  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
""" }}}

""" Snippets {{{
  Plug 'honza/vim-snippets'

  " UltiSnips
  Plug 'SirVer/ultisnips'
  let g:UltiSnipsUsePythonVersion = 3
  let g:UltiSnipsSnippetDirectories=["UltiSnips", expand("$HOME/.onhernandes/dotfiles/vim/snippets")]
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
""" }}}

""" Miscellaneous and Utils {{{ 
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-dispatch'
  Plug 'rhysd/clever-f.vim'
  Plug 'bling/vim-bufferline'
  Plug 'somini/vim-autoclose'
  Plug 'mhinz/vim-startify'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'tpope/vim-sensible'
  Plug 'wakatime/vim-wakatime'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-unimpaired'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mileszs/ack.vim'

  " Bookmarks
  Plug 'MattesGroeger/vim-bookmarks'
  let g:bookmark_no_default_key_mappings = 1
  function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
  endfunction
  function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
  endfunction
  autocmd BufEnter * :call BookmarkMapKeys()
  autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

  " Lightline/Statusline
  Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

  " Signify
  Plug 'mhinz/vim-signify'
  let g:signify_sign_add = '+'
  let g:signify_sign_delete = '_'
  let g:signify_sign_delete_first_line = '‾'
  let g:signify_sign_change = '~'
  let g:signify_sign_changedelete = g:signify_sign_change

  " Ale
  Plug 'w0rp/ale'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '▲'
  let g:ale_set_quickfix = 1
  "let g:ale_open_list = 1
  nnoremap <leader>af :ALEFix<CR>
  nnoremap <leader>al :ALELint<CR>
  let g:ale_fixers = 
    \ {
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint'],
      \ 'python': ['black']
    \ }
  let g:ale_linters = 
    \ {
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint'],
      \ 'python': ['black']
    \ }

  " NerdTree
  Plug 'jojoyuji/nerdtree-async'
  Plug 'ivalkeen/nerdtree-execute'
  Plug 'tyok/nerdtree-ack'
  let g:indent_guides_exclude_filetypes = ['nerdtree'] " fixes the folding issue on NERDTree
  let NERDTreeShowBookmarks=1
  let NERDTreeDirArrows=1
  let NERDTreeHijackNetrw=0

  autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   NERDTree
    \ |   wincmd w
    \ | endif

  " Targets
  Plug 'wellle/targets.vim'
  let g:targets_quotes = '"d ''q `'

  " Switch
  Plug 'AndrewRadev/switch.vim'
  let g:switch_mapping="-"
  let g:switch_custom_definitions =
    \ [
    \   ['true', 'false'],
    \   ['typeof', 'instanceof'],
    \   ['unshift', 'push'],
    \   ['log', 'error', 'debug', 'warn'],
    \   ['null', 'undefined', 'NaN'],
    \   ['map', 'forEach', 'filter', 'reduce'],
    \   ['let', 'const', 'var'],
    \   ['console.log', 'console.warn', 'console.error'],
    \   ['log', 'warn', 'error'],
    \   ['before', 'after'],
    \   ['True', 'False', 'None'],
    \   ['get', 'put', 'post', 'delete'],
    \   ['exports', 'module.exports'],
    \   ['right', 'left'],
    \   ['top', 'bottom']
    \ ]
""" }}}

""" Files {{{ 
  Plug 'zoubin/vim-gotofile', { 'for': ['javascript'] }

  " FZF Stuff
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  command! -bang -nargs=* GitAg
    \ call fzf#vim#ag(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)
""" }}}

""" JavaScript/JSON {{{ 
  " Vim JSON support
  Plug 'leshill/vim-json', {'for': 'json'}
  " Syntax Highlight key and value
  Plug 'elzr/vim-json', {'for': 'json'}
  " JSON Formatter: <leader>json
  Plug 'XadillaX/json-formatter.vim', {'for': 'json', 'do': 'npm install jjson -g'}
  " Better JS Highlight
  Plug 'othree/yajs.vim', {'for': 'javascript'}
  " Highlight JavaScript's Template Strings contents in other FileType syntax rule
  Plug 'Quramy/vim-js-pretty-template', {'for': 'javascript'}

  " JSDocs
  Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
  let g:jsdoc_enable_es6=1

  " JS Libs
  let g:used_javascript_libs = 'vue,lodash'

  " NodeJS
  Plug 'moll/vim-node', {'for': 'javascript'}
""" }}}

""" Python {{{
""" }}}

""" HTML/CSS/FrontEnd Stuff {{{
  Plug 'ap/vim-css-color', {'for': ['css', 'scss', 'sass']}
  Plug 'tpope/vim-liquid', {'for': 'liquid'}
  Plug 'mustache/vim-mustache-handlebars', {'for': ['html.handlebars', 'html.mustache']}

  " Emmet
  Plug 'mattn/emmet-vim', {'for': [
    \ 'vue', 'scss', 'sass', 
    \ 'css', 'html',
    \ 'pug', 'html.handlebars', 
    \ 'html.mustache'
  \ ]}
  let g:user_emmet_mode='a'

  " VueJS
  Plug 'posva/vim-vue', { 'for': 'vue' }
  let g:vue_disable_pre_processors = 1
""" }}}

""" Themes and Colors {{{ 
  Plug 'jdkanani/vim-material-theme'
""" }}}

if filereadable(expand("$HOME/.onhernandes/dotfiles/vim/local/plugins.vim"))
  so $HOME/.onhernandes/dotfiles/vim/local/plugins.vim
endif

call plug#end()
   
" Theme & Syntax
if !exists('g:syntax_on')
  syntax enable
endif    

set background=dark
colorscheme material-theme
