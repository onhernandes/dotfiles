local M = {}

M.setup_config = function ()
  -- for nvim-tree
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- General settings
  vim.g.mapleader = " " -- map leader to space
  vim.opt.encoding = "UTF-8" -- encoding
  vim.opt.swapfile = false -- don't use swap files

  -- White characters
  vim.opt.autoindent = true
  vim.opt.smartindent = true
  vim.opt.cindent = true
  vim.opt.tabstop = 2 -- 1 tab = 2 spaces
  vim.opt.shiftwidth = 2 -- indentation rule
  vim.opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word, experimental
  vim.opt.expandtab = true -- expand tab to spaces

  -- Display
  vim.opt.scrolloff = 3 -- always show 3 rows from edge of the screen
  vim.opt.laststatus = 2 -- always show status line

  -- Experimental Display settings
  vim.opt.showmatch  = true -- show matching brackets, experimental
  vim.opt.synmaxcol = 500 -- stop syntax highlight after x lines for performance, experimental
  vim.opt.wrap = true -- wrap lines, experimental
  vim.opt.eol = false -- show if there's no eol char, experimental
  vim.opt.showbreak= '↪' -- character to show when line is broken, experimental

  -- Sidebar
  vim.opt.number = true -- line number on the left
  vim.opt.numberwidth = 4 -- always reserve 4 spaces for line number
  vim.opt.showcmd = true -- display command in bottom bar
  -- vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
  vim.opt.modelines = 0

  -- Windows
  vim.opt.splitright = true -- set to split new window to right of current one
  vim.opt.splitbelow = true -- set to split new window to under current one
  vim.opt.title = true -- when on, the title of the window will be set to the value o titlestring

  -- Misc
  vim.opt.virtualedit = "all" -- allow to virtually edit chars where they don't exist
  vim.opt.clipboard = "unnamedplus" -- syncs nvim clipboard & system clipboard
  vim.opt.more = true -- keep loading lists
  vim.opt.showmode = false
  vim.opt.completeopt = "menu,preview,longest" -- list of options for Insert mode completion
  vim.opt.expandtab = true
  vim.opt.termguicolors = true
  vim.opt.pastetoggle = '<F6>'

  -- Wildmode/wildmenu command-line completion
  vim.opt.wildmenu = true -- on TAB autocomplete command options
  vim.opt.wildignore = '*.bak,*.swp,*.swo,*.a,*.o,*.so,*.pyc,*.class,*.jpg,*.jpeg,*.gif,*.png,*.pdf,*/.git*,*.tar,*.zip,*node_modules/*,*dist/*,*public/*,coverage,*/__pycache__/*'
  vim.opt.wildmode = 'longest:full,list:full'

  -- Return to last edit position when opening files
  vim.cmd([[
    augroup LastPosition
      autocmd! BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif
    augroup END
  ]])
end

return M
