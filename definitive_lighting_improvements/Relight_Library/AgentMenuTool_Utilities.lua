--gets the length of the property key array and returns an integer with the length
custom_GetPropertyLength = function(propertyKeys)
    --temp variable
    local newLength = 0
    
    --if the keys exist
    if propertyKeys then
        --begin iterating through the propery key loop
        for i, property in ipairs(propertyKeys) do
            --increment newLength
            newLength = newLength + 1
        end
    end
    
    --return the result
    return newLength
end

--gets the key and if it's a symbol it removes the symbol: tag and quotations
local custom_KeyToString = function(key)
    --convert the key to a string
    local keyAsString = tostring(key)
    
    --if the string contains symbol: then remove it, otherwise keep the string as is
    if (string.match)(keyAsString, "symbol: ") then
        keyAsString = (string.sub)(keyAsString, 9)
    else
        keyAsString = keyAsString
    end
    
    --remove any leftover quotations from the string (if there are any)
    if (string.match)(keyAsString, '"') then
        keyAsString = keyAsString:gsub('"','')
    end

    --return the final result
    return keyAsString
end