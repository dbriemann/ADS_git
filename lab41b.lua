
local g = {{}, {}}

local function findTbyX(ox, x)
    for _,entry in ipairs(ox) do
        if entry[1] == x then
            return entry[2]
        end
    end
end

local function isSetInOx(set, ox)
    local result = false
    for _,entry in ipairs(set) do
        for i,e in ipairs(entry) do
            if e == ox[i]
        end
    end
    return result
end

local function genBE(generators, x, neutral)
    local Ox = {{x, neutral}}
    local Ex = {}
    
    local queue = {x}
    
    while #queue > 0 do
        local xx = queue[1]
        table.remove(queue, 1)
        local t = findTbyX(Ox, xx)
        
        for _,e in ipairs(generators) do
            local xxx = {}
            for _,xxe in ipairs(xx) do
                table.insert(xxx, e[xxe+1])
                table.sort(xxx)
            end
            
        end
    end
end

