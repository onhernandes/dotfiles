local M = {
	actions = {},
	runners = {},
	global_options = {
		ft = { "typescript" },
	},
}

local notify = require("notify")

M.add_action = function(props)
	require("bubblegum.utils").add_action(M.actions, props)
end

M.add_action({
	action_name = "ts_remove_unused",
	ft = M.global_options.ft,
	title = "Typescript Remove unused",
	description = "Typescript Remove unused code",
	runner = function()
		local ts = require("typescript")
		ts.actions.removeUnused()
	end,
})

M.add_action({
	action_name = "ts_refactor_code",
	title = "Typescript Refactor code",
	description = "Typescript Refactor code using all available LSP / TS Actions",
	ft = M.global_options.ft,
	runner = function()
		local ts = require("typescript")
		ts.actions.fixAll()
		ts.actions.removeUnused()
		ts.actions.organizeImports()
	end,
})

M.add_action({
	action_name = "ts_add_missing_imports",
	title = "Typescript Add missing imports",
	description = "Run LSP Action from tsserver to add all missing imports, if available",
	ft = M.global_options.ft,
	runner = require("typescript").actions.addMissingImports,
})

M.add_action({
	action_name = "ts_organize_imports",
	title = "Typescript organize imports with LSP",
	description = "Run LSP Action from tsserver to organize imports",
	ft = M.global_options.ft,
	runner = require("typescript").actions.organizeImports,
})

M.add_action({
	action_name = "ts_fix_all",
	title = "Typescript Fix All action",
	description = "Run LSP Action from tsserver to try to fix errors in code",
	ft = M.global_options.ft,
	runner = require("typescript").actions.fixAll,
})

M.get_actions = function()
	return M.actions
end

return M
