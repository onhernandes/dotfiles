local M = {}

function Run_fred()
    local notify = require("notify")
    local code_actions = {
      ':TypescriptAddMissingImports',
      ':TypescriptOrganizeImports',
      ':TypescriptFixAll',
      ':Trouble document_diagnostics',
      ':Trouble references',
      'CodeAction Rename',
      'List CodeActions'
    }

    -- Desired actions:
    -- npm install package
    -- python install package
    -- npm sync using npm ci + nvm
    -- nvm use

    local function call_trouble_doc()
      require("trouble").toggle({ mode = 'document_diagnostics' })
    end

    local function call_trouble_references()
      require("trouble").toggle({ mode = 'lsp_references' })
    end

    local function call_rename_code_action()
      vim.lsp.buf.rename()
    end

    local function call_code_action_range()
      vim.lsp.buf.code_action()
    end

    local function npm_install()
      local title = "Install NPM Package"
      local src = vim.loop.cwd()
      local pkg_path = src .. '/package.json'
      local package_json_exists = vim.loop.fs_stat(pkg_path)
      local function on_input(input)
        local is_input_valid = input ~= nil and vim.fn.strchars(input) > 0
        if is_input_valid then
          -- install
        end

        if not is_input_valid then
          notify("invalid input", "error", { title = title })
        end
      end
      if package_json_exists then
        vim.ui.input({ prompt = 'Which package do you want to install?' }, on_input)
      end

      if not package_json_exists then
        notify("package.json not found at " .. pkg_path, "error", { title = title })
      end
    end

    local actions_by_cmd = {
      [':TypescriptAddMissingImports'] = require("typescript").actions.addMissingImports,
      [':TypescriptOrganizeImports'] = require("typescript").actions.organizeImports,
      [':TypescriptFixAll'] = require("typescript").actions.fixAll,
      [':Trouble document_diagnostics'] = call_trouble_doc,
      [':Trouble references'] = call_trouble_references,
      ['CodeAction Rename'] = call_rename_code_action,
      ['List CodeActions'] = call_code_action_range
    }

    local ui_select_opts = {
      prompt = 'Choose a code action: ',
    }

    local function on_choose_magic_action (action)
      local fn_action_name = actions_by_cmd[action]
      if fn_action_name then
        fn_action_name()
      end
    end

    vim.ui.select(code_actions, ui_select_opts, on_choose_magic_action)
end

M.setup_fred = function (use)
  use {
    'folke/trouble.nvim',
    requires = {'nvim-tree/nvim-web-devicons', 'rcarriga/nvim-notify'},
    ensure_installed = true,
    config = function ()
      require('trouble').setup({
        mode = 'document_diagnostics',
        indent_lines = false,
      })
    end
  }

  vim.api.nvim_set_keymap('n', '<leader>t', ':lua Run_fred()<CR>', { noremap = true })
end

return M
