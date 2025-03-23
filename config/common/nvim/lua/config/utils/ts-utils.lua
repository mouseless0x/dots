local M = {}

-- Function to convert regular parameters to object parameters
M.convert_to_object_params = function()
    -- Get current line
    local line = vim.api.nvim_get_current_line()
    
    -- Try to match both function declarations and anonymous functions
    local function_part, params = line:match("([^%(]+)%((.-)%)")
    
    if not function_part or not params then
        vim.notify("No function parameters found", vim.log.levels.WARN)
        return
    end
    
    -- Split parameters by comma
    local param_list = {}
    for param in params:gmatch("([^,]+)") do
        param = param:match("^%s*(.-)%s*$") -- trim whitespace
        table.insert(param_list, param)
    end
    
    -- Extract param names and types, preserving optionality
    local param_names = {}
    local param_types = {}
    local is_optional = {}
    
    for _, param in ipairs(param_list) do
        -- Handle optional parameters (with ?)
        local name, optional, type = param:match("([%w_]+)(%??)%s*:%s*(.+)")
        if name and type then
            table.insert(param_names, name)
            param_types[name] = type
            is_optional[name] = optional == "?" -- true if parameter is optional
        else
            -- Try without type annotation
            local name = param:match("([%w_]+)")
            if name then
                -- Check if it's optional without type
                local base_name = name:match("([%w_]+)%??")
                if base_name then
                    is_optional[base_name] = name:match("?") ~= nil
                    table.insert(param_names, base_name)
                    param_types[base_name] = "any"
                else
                    table.insert(param_names, name)
                    param_types[name] = "any"
                    is_optional[name] = false
                end
            end
        end
    end
    
    if #param_names == 0 then
        vim.notify("No parameters found", vim.log.levels.WARN)
        return
    end
    
    -- Create destructured object parameter
    local names_str = "{" .. table.concat(param_names, ", ") .. "}"
    
    -- Create type definition
    local types_str = "{" 
    for i, name in ipairs(param_names) do
        -- Add optional marker if parameter was optional
        local optional_marker = is_optional[name] and "?" or ""
        types_str = types_str .. name .. optional_marker .. ": " .. param_types[name]
        if i < #param_names then
            types_str = types_str .. ", "
        end
    end
    types_str = types_str .. "}"
    
    -- Replace the line
    local new_line = line:gsub(
        "([^%(]+)%(" .. vim.pesc(params) .. "%)", 
        "%1(" .. names_str .. ": " .. types_str .. ")"
    )
    
    vim.api.nvim_set_current_line(new_line)
end

return M