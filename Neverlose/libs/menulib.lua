---@diagnostic disable: undefined-global
_DEBUG = true;
local clipboard = require("neverlose/clipboard")
local inspect
if _DEBUG then
    inspect = require("neverlose/inspect")
end

local helpers = {
    clone_table = function (t)
        return { table.unpack(t) }
    end,

    split = function (str, sep)
        if sep == nil then
            sep = "%s"
        end

        local t={}

        for str in string.gmatch(str, "([^"..sep.."]+)") do
            table.insert(t, str)
        end

        return t
    end
}

Menu = {}

Menu.new = function (self)
    local new = {
        _last_idx = 0
    }
    setmetatable(new, self)
    self.__index = self
    return new
end

Menu.check_name = function (name)
    if name:sub(0, 1) == "_" then
        if _DEBUG then
            error("Invalid name")
        else
            print_error("Invalid name!")
            return false
        end
    else
        return true
    end
end

Menu.get_keys = function (t)
    if not type(t) == "table" then return end

    local keys = {}
    for key,_ in pairs(t) do
        table.insert(keys, key)
    end

    return keys
end

Menu.add_tab = function (self, name)
    if not self.check_name(name) then
        return
    end

    if self[name:lower()] then return end

    self[name:lower()] = {}
end

-- Creates a group with specified name and returns its index, used in get_group
Menu.add_group = function (self, group_name, tab_name, parent_idx)
    if parent_idx == nil then

        if not self.check_name(group_name) or not self.check_name(tab_name) then return end

        if self[group_name:lower()] then return error("Dead 1") end

        if not self[tab_name:lower()] then self:add_tab(tab_name) end

        self._last_idx = self._last_idx + 1

        local group_ref = ui.create(tab_name, group_name)
        self[tab_name:lower()][group_name:lower()] = {
            _ref = group_ref,
            _idx = self._last_idx
        }

        return self._last_idx
    else
        local parents = self:get_element()
        if not parents or not parents[parent_idx] then return end

        local parent = parents[parent_idx]

        self._last_idx = self._last_idx + 1

        local group_ref = parent._ref:create(group_name)
        parent[group_name:lower()] = {
            _ref = group_ref,
            _idx = self._last_idx
        }

        return self._last_idx
    end
end

Menu.add_element = function(self, element_name, element_type, group_index, element_options)
    if not self.check_name(element_name) then return end

    local groups = self:get_group()
    if not groups or not groups[group_index] or not groups[group_index]._ref then return end

    local group = groups[group_index]
    local element_ref = group._ref[element_type:lower()](group._ref, element_name, table.unpack(element_options))
    self._last_idx = self._last_idx + 1
    group[element_name:lower()] = {
        _ref = element_ref,
        _idx = self._last_idx
    }

    return self._last_idx
end

Menu.get_group = function (self, name)
    name = name or ""

    local groups_table = {}
    for _,tab in pairs(self) do --Iterate Tabs
        if type(tab) == "table" then
            for group_name, group in pairs(tab) do --Iterate Groups
                if group_name:find(name:lower()) then
                    groups_table[group._idx] = group
                else
                    groups_table[group._idx] = nil
                end

                for _, element in pairs(group) do --Iterate Elements
                    if type(element) == "table" then
                        for sub_group_name,sub_group in pairs(element) do --Iterate Sub-Groups
                            if type(sub_group) == "table" then
                                if sub_group_name:find(name:lower()) then
                                    groups_table[sub_group._idx] = sub_group
                                else
                                    groups_table[sub_group._idx] = nil
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return groups_table
end

Menu.get_element = function (self, name)
    name = name or ""

    local elements = {}
    for _,tab in pairs(self) do
        if type(tab) == "table" then
            for _,group in pairs(tab) do
                if type(group) == "table" then
                    for element_name,element in pairs(group) do
                        if type(element) == "table" then
                            if element_name:find(name:lower()) then
                                table.insert(elements, element._idx, element)
                            else
                                table.insert(elements, element._idx, nil)
                            end
                            if type(element) == "table" then
                                for _, subgroup in pairs(element) do
                                    if type(subgroup) == "table" then
                                        for sub_element_name,sub_element in pairs(subgroup) do
                                            if type(sub_element) == "table" then
                                                if sub_element_name:find(name:lower()) then
                                                    table.insert(elements, sub_element._idx, sub_element)
                                                else
                                                    table.insert(elements, sub_element._idx, nil)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return elements
end

Menu.create_module = function (self, name, tab, modules)
    if not self.check_name(name) or not type(modules) == "table" then return end

    local module_group_idx = self:add_group(name, tab)
    if not module_group_idx then return end

    local keys = {}
    for i,v in ipairs(modules) do
        keys[i] = v.name
    end
    if not keys then return end

    local list_idx = self:add_element("", "list", module_group_idx, keys)
    if not list_idx then return end

    local list = self:get_element()[list_idx]
    if not list then return end

    local groups = {}


    for _, module in ipairs(modules) do
        for _, group in ipairs(module) do
            local group_idx = self:add_group(group.name, tab)

            self:get_group()[group_idx]._ref:visibility(false)

            groups[module.name] = groups[module.name] or {}
            groups[module.name][group.name] = group_idx

            for _,element in ipairs(group) do
                self:add_element(element.name, element.type, group_idx, element.options)
            end
        end
    end

    list._ref:set_callback(function (_self)
        local idx = _self:get()
        local items = helpers.clone_table(keys);

        items[idx] = "\a" .. color("#0E0EFF"):to_hex() .. "⇝" .. "\a" .. color("#FFFFFF"):to_hex() .. " " .. items[idx];

        _self:update(items)

        for module_name,module in pairs(groups) do
            for _,group_idx in pairs(module) do
                local group = self:get_group()[group_idx]
                -- print(group._ref:name())

                group._ref:visibility(module_name == items[idx]:sub(#items[idx] - #module_name + 1, #items[idx]))
            end
        end
    end, true)
end

Menu.export = function (self)
    local elements = self:get_element("")
    if not elements then return end

    local values = {
        "_MENULIBDATA"
    }
    for _,element in pairs(elements) do
        table.insert(values, element._idx, element._ref:get())
    end
    return json.stringify(values)
end

Menu.import = function (self, settings)
    local elements = self:get_element("")
    if not elements then return end

    local values = json.parse(settings)
    if not values or not values[1] == "_MENULIBDATA" then return end

    for _,element in pairs(elements) do
        element._ref:set(values[element._idx - 1])
    end
end

return Menu