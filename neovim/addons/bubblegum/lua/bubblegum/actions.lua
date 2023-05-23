local M = {
	actions = {},
}

local bubble_utils = require("bubblegum.utils")

M.compare_equal = function(value, desired)
	return value == desired
end

M.add_action = function(props)
	bubble_utils.add_action(M.actions, props)
end

M.add_action({
	action_name = "toggle_trouble_doc",
	ft = { "any" },
	runner = function()
		require("trouble").toggle({ mode = "document_diagnostics" })
	end,
	title = "Toggle Trouble document_diagnostics",
	description = "Toggle Trouble in mode document_diagnostics",
})

M.add_action({
	action_name = "toggle_trouble_refs",
	ft = { "any" },
	runner = function()
		require("trouble").toggle({ mode = "lsp_references" })
	end,
	title = "Toggle Trouble lsp_references",
	description = "Toggle Troube in mode lsp_references for word under cursor",
})

M.add_action({
	action_name = "lsp_rename",
	ft = { "any" },
	runner = function()
		vim.lsp.buf.rename()
	end,
	title = "LSP Rename",
	description = "Uses LSP to rename token under cursor, which may be a type, a function or variable name, etc",
})

M.add_action({
	action_name = "lsp_list_code_actions",
	ft = { "any" },
	runner = function()
		vim.lsp.buf.code_action()
	end,
	title = "List CodeActions",
	description = "List available CodeActions",
})

M.add_action({
	action_name = "py_organize_imports",
	title = "Python Organize Imports",
	description = "Run LSP Action from pyright organize imports",
	ft = { "python" },
	runner = function()
		vim.api.nvim_command(":PyrightOrganizeImports<CR>")
	end,
})

M.actions = bubble_utils.merge_all_actions(
  M.actions,
	require("bubblegum.npm_actions").get_actions(),
	require("bubblegum.typescript-actions").get_actions()
)

M.run_action_by_key = function(key, value, compare)
	compare = compare or M.compare_equal
	local found = {}
	local has_been_found = false
	-- Iterate over the M.actions table
	for i, item in ipairs(M.actions) do
		local are_equal = compare(item[key], value)
		if are_equal then
			has_been_found = true
			found =
				{ run = item.run, title = item.title, description = item.description, action_name = item.action_name }
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
