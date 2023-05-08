local M = {}
local utils = require("utils")

M.setup_mappings = function ()
  vim.cmd([[
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
  ]])
  utils.nmap('<leader>q', '<esc>:call CloseCurrentBuffer()<cr>')

  -- Map moving-keys for sugestions/completions in insert-mode
  utils.imap('<c-k>', '<c-p>')
  utils.imap('<c-j>', '<c-n>')

  -- Map ; to : in normal and visual mode
  utils.nmap(';', ':')
  utils.vmap(';', ':')

  -- Map reload and edit for init.lua
  --nmap('<leader>so', ':so $DOTFILES/neovim/init.lua<cr>');
  utils.nmap('<leader>rr', ':edit $DOTFILES/neovim/init.lua<cr>');

  -- Map :Files as Find Files
  utils.nmap('<leader>ff', ':Files ./<cr>')

  -- Map :Ag as Find Code
  utils.nmap('<leader>fc', ':Ag <cr>')

  -- Bubble single lines to CTRL + ALT + j
  utils.nmap('<c-a-j>', ']e')
  utils.nmap('<c-a-k>', '[e')

  -- Bubble multiple lines to CTRL + ALT + j
  utils.vmap('<c-a-j>', ']egv')
  utils.vmap('<c-a-k>', '[egv')

  -- leader + space clear highlight
  utils.nmap('<leader><space>', ':silent noh<cr>')

  -- Make the fold that we're currently in the only fold showing; 
  -- collapse all other folds. Mnemonic: "z This"
  utils.nmap('zt', 'zMzvzczO')

  -- jj to <esc>
  utils.imap('jj', '<esc>')

  -- <tab> indent
  utils.vmap('<tab>', '>gv')
  utils.vmap('<s-tab>', '<gv')
  utils.nmap('<tab>', '>>')
  utils.nmap('<s-tab>', '<<')

  -- Map leader save
  utils.nmap('<leader>w', ':w!<cr>')

  -- Map next and previous buffer
  utils.nmap('<leader>l', ':bn<cr>')
  utils.nmap('<leader>h', ':bp<cr>')

  -- Map resize horizontal splits
  utils.nmap('<leader>j', ':res -1<cr>')
  utils.nmap('<leader>k', ':res +1<cr>')
  utils.nmap('<c-h>', '<c-w>h')

  -- Map :Buffers
  utils.nmap('<leader>b', ':Buffers<cr>')

  -- Map horizontal and vertical split of the same file
  utils.nmap('<leader>s', ':split %<cr>')
  utils.nmap('<leader>vs', ':vsplit %<cr>')

  -- Abbreviations
  vim.cmd([[
    iabbrev lenght length
    iabbrev widht width
    iabbrev assing assign
  ]])
  utils.nmap('<leader>rs', ':source $MYVIMRC<CR>')
end

return M
