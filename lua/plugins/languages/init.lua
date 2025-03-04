local current_path = 'plugins.languages.'

local current_list = {
    require(current_path .. 'lua'),
}

local flattened_list = {}
for _, v in ipairs(current_list) do
    for _, _v in ipairs(v) do
        table.insert(flattened_list, _v)
    end
end

return flattened_list
