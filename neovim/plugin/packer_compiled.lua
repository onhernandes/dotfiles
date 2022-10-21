-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hernandes/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["ack.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ale = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["es.next.syntax.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/es.next.syntax.vim",
    url = "https://github.com/othree/es.next.syntax.vim"
  },
  ["eva01.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/eva01.vim",
    url = "https://github.com/hachy/eva01.vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["json-formatter.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/json-formatter.vim",
    url = "https://github.com/XadillaX/json-formatter.vim"
  },
  ["leshill-vim-json"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json",
    url = "https://github.com/leshill/vim-json"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nerdtree-ack"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nerdtree-ack",
    url = "https://github.com/tyok/nerdtree-ack"
  },
  ["nerdtree-execute"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nerdtree-execute",
    url = "https://github.com/ivalkeen/nerdtree-execute"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["quickfix-reflector.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/quickfix-reflector.vim",
    url = "https://github.com/stefandtw/quickfix-reflector.vim"
  },
  ["switch.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["typescript-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ["vim-autoclose"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-autoclose",
    url = "https://github.com/somini/vim-autoclose"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-bookmarks",
    url = "https://github.com/MattesGroeger/vim-bookmarks"
  },
  ["vim-bufferline"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-bufferline",
    url = "https://github.com/bling/vim-bufferline"
  },
  ["vim-css-color"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-gotofile"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-gotofile",
    url = "https://github.com/zoubin/vim-gotofile"
  },
  ["vim-js-pretty-template"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-js-pretty-template",
    url = "https://github.com/Quramy/vim-js-pretty-template"
  },
  ["vim-jsdoc"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsdoc",
    url = "https://github.com/heavenshell/vim-jsdoc"
  },
  ["vim-jsx-pretty"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-jsx-pretty",
    url = "https://github.com/MaxMEllon/vim-jsx-pretty"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-node"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node",
    url = "https://github.com/moll/vim-node"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vue"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue",
    url = "https://github.com/posva/vim-vue"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["yajs.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/yajs.vim",
    url = "https://github.com/othree/yajs.vim"
  },
  ["yats.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'BetterLua.vim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'leshill-vim-json', 'json-formatter.vim', 'vim-gotofile'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'vim-gotofile', 'vim-jsx-pretty', 'emmet-vim'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'vim-gotofile', 'vim-jsx-pretty', 'emmet-vim'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim', 'es.next.syntax.vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'emmet-vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim', 'vim-css-color'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'emmet-vim', 'vim-css-color'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'yajs.vim', 'vim-gotofile', 'vim-js-pretty-template', 'vim-jsdoc', 'vim-jsx-pretty', 'vim-node', 'es.next.syntax.vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'emmet-vim', 'vim-css-color'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'yajs.vim', 'yats.vim', 'typescript-vim', 'vim-gotofile', 'vim-js-pretty-template', 'vim-jsx-pretty', 'vim-node', 'es.next.syntax.vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-vue', 'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue/ftdetect/vue.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue/ftdetect/vue.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-vue/ftdetect/vue.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/yats.vim/ftdetect/typescriptreact.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/typescript-vim/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/leshill-vim-json/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node/ftdetect/node.vim]], true)
vim.cmd [[source /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node/ftdetect/node.vim]]
time([[Sourcing ftdetect script at: /home/hernandes/.local/share/nvim/site/pack/packer/opt/vim-node/ftdetect/node.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
