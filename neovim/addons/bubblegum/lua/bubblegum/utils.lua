local M = {}

M.add_action = function(actions, props)
	local action_name = props.action_name
	local runner = props.runner
	local title = props.title
	local description = props.description

	table.insert(
		actions,
		{
			name = action_name,
			run = runner,
			title = title,
			description = description,
			ft = props.ft or {},
			files = props.files or {},
		}
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

M.compare_equal = function(value, desired)
	return value == desired
end

M.list_contains = function(list, item)
	for _, str in ipairs(list) do
		if string.find(str, item) or string.find(item, str) then
			return true
		end
	end
	return false
end

M.run_action_by_key = function(actions, key, value, compare)
	compare = compare or M.compare_equal
	local found = {}
	local has_been_found = false

	-- Iterate over the actions table
	for i, item in ipairs(actions) do
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

M.on_select = function(actions)
	return function(title)
		M.run_action_by_key(actions, "title", title)
	end
end

return M
