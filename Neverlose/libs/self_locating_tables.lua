local self_locating_tables = {}

function self_locating_tables.get_data_from(meta_table)
    local main_table = {}
    setmetatable(main_table, {__index = meta_table})

    return main_table
end

return self_locating_tables