
module(..., package.seeall);

local function generate_symmetric_group(p, n)
    if n == 0 then
        coroutine.yield(p)
    else
        for i=1,n do    
            -- (1) switch i-th element with last one
            p[n], p[i] = p[i], p[n]
            -- (2) recursively call function for sub-group
            generate_symmetric_group(p, n - 1)    
            -- (3) switch back elements from step (1)
            p[n], p[i] = p[i], p[n]    
        end
    end
end

local function gen_sym(n)
    local start_table = {}
    for i=0,n-1 do start_table[i+1] = i end
    
    generate_symmetric_group(start_table, n)
end

function sym_group_iterator (n)    
    local co = coroutine.create(function () gen_sym(n) end)
    return function ()   -- iterator
        local code, res = coroutine.resume(co)
        return res
    end
end
