local M = {
  actions = {}
}

local notify = require("notify")

M.compare_equal = function (value, desired)
  return value == desired
end

M.add_action = function (props)
  local action_name = props.action_name
  local runner = props.runner
  local title = props.title
  local description = props.description

  table.insert(
    M.actions,
    { name = action_name, run = runner, title = title, description = description, ft = props.ft or {} }
  )
end

M.add_action({
  action_name = "npm_install_pkg",
  title = "NPM Install Package",
  description = "Uses NPM and install desired package into current project",
  ft = {"typescript"},
  runner = function ()
    local Terminal = require("toggleterm.terminal").Terminal
    local title = "Install NPM Package"
    local src = vim.loop.cwd()
    local pkg_path = src .. '/package.json'
    local package_json_exists = vim.loop.fs_stat(pkg_path)

    local function on_input(input)
      local save_param = "--save"
      if string.find(input, "-SD") then
        save_param = "--save-dev"
        input = string.gsub(input, "-SD", "")
      end
      input = input:gsub("^%s*(.-)%s*$", "%1")
      local is_input_valid = input ~= nil and vim.fn.strchars(input) > 0

      if is_input_valid then
        local npm_cmd = "npm install " .. save_param .. " " .. input
        notify("Installing...", "info", { title = title })
        local npm_i_term = Terminal:new({
          cmd = npm_cmd,
          dir = src,
          close_on_exit = true,
          hidden = true,
          direction = "vertical",
          on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", ":close<CR>", { noremap = true, silent = true })
          end,
          on_exit = function ()
            notify("Installation finished", "info", { title = title })
          end
        })

        npm_i_term:toggle()
      end

      if not is_input_valid then
        notify("invalid input " .. input, "error", { title = title })
      end
    end
    if package_json_exists then
      vim.ui.input({ prompt = 'Which package do you want to install?' }, on_input)
    end

    if not package_json_exists then
      notify("package.json not found at " .. pkg_path, "error", { title = title })
    end
  end
})

M.add_action({
  action_name = "toggle_trouble_doc",
  ft = {"any"},
  runner = function ()
    require("trouble").toggle({ mode = "document_diagnostics" })
  end,
  title = "Toggle Trouble document_diagnostics",
  description = "Toggle Trouble in mode document_diagnostics"
})

M.add_action({
  action_name = "toggle_trouble_refs",
  ft = {"any"},
  runner = function ()
    require("trouble").toggle({ mode = "lsp_references" })
  end,
  title = "Toggle Trouble lsp_references",
  description = "Toggle Troube in mode lsp_references for word under cursor"
})

M.add_action({
  action_name = "lsp_rename",
  ft = {"any"},
  runner = function ()
    vim.lsp.buf.rename()
  end,
  title = "LSP Rename",
  description = "Uses LSP to rename token under cursor, which may be a type, a function or variable name, etc"
})

M.add_action({
  action_name = "lsp_list_code_actions",
  ft = {"any"},
  runner = function ()
    vim.lsp.buf.code_action()
  end,
  title = "List CodeActions",
  description = "List available CodeActions"
})

M.add_action({
  action_name = "ts_remove_unused",
  ft = {"typescript"},
  title = "Typescript Remove unused",
  description = "Typescript Remove unused code",
  runner = function ()
    local ts = require("typescript")
    ts.actions.removeUnused()
  end
})

M.add_action({
  action_name = "ts_refactor_code",
  title = "Typescript Refactor code",
  description = "Typescript Refactor code using all available LSP / TS Actions",
  ft = {"typescript"},
  runner = function ()
    local ts = require("typescript")
    ts.actions.fixAll()
    ts.actions.removeUnused()
    ts.actions.organizeImports()
  end
})

M.add_action({
  action_name = "ts_add_missing_imports",
  title = "Typescript Add missing imports",
  description = "Run LSP Action from tsserver to add all missing imports, if available",
  ft = {"typescript"},
  runner = require("typescript").actions.addMissingImports
})

M.add_action({
  action_name = "ts_organize_imports",
  title = "Typescript organize imports with LSP",
  description = "Run LSP Action from tsserver to organize imports",
  ft = {"typescript"},
  runner = require("typescript").actions.organizeImports
})

M.add_action({
  action_name = "ts_fix_all",
  title = "Typescript Fix All action",
  description = "Run LSP Action from tsserver to try to fix errors in code",
  ft = {"typescript"},
  runner = require("typescript").actions.fixAll
})

M.add_action({
  action_name = "py_organize_imports",
  title = "Python Organize Imports",
  description = "Run LSP Action from pyright organize imports",
  ft = {"python"},
  runner = function ()
    vim.api.nvim_command(":PyrightOrganizeImports<CR>")
  end
})

M.run_action_by_key = function (key, value, compare)
  compare = compare or M.compare_equal
  local found = {}
  local has_been_found = false
  -- Iterate over the M.actions table
  for i, item in ipairs(M.actions) do
    local are_equal = compare(item[key], value)
    if are_equal then
      has_been_found = true
      found = { run = item.run, title = item.title, description = item.description, action_name = item.action_name }
      break
    end
  end

  if has_been_found then
    found.run()
    return { success = true, data = found }
  end

  return { success = false }
end

return M
