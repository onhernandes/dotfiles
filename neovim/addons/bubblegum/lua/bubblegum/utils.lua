local M = {}

M.add_action = function(actions, props)
	local action_name = props.action_name
	local runner = props.runner
	local title = props.title
	local description = props.description

	table.insert(
		actions,
		{ name = action_name, run = runner, title = title, description = description, ft = props.ft or {} }
	)
	return actions
end

M.merge_all_actions = function(...)
	local joint_table = {}

	-- Iterate over each table
	for _, table_to_merge in ipairs({ ... }) do
		-- Merge elements from the current table
		for _, value in pairs(table_to_merge) do
			table.insert(joint_table, value)
		end
	end

	return joint_table
end

M.merge_actions = function(state_actions, input_actions)
	for key, value in pairs(input_actions) do
		state_actions[key] = value
	end

	return state_actions
end

return M
