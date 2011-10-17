
module(..., package.seeall);

--require "utils"

function mult_permutations(p1, p2)
    local result = {}
    for i,v in ipairs(p2) do
        result[i] = p1[v + 1]
    end
    return result
end

function invert_permutation(p)
    local result = {}
    for i,v in ipairs(p) do
        result[v+1] = i - 1
    end
    return result
end

function print_cycles(p)
    local visited = {}
    local cycle_string = ""
    
    if (#p > 1) then
        for i=1,#p do
            local pos = i
            if (p[pos] + 1 ~= pos and not visited[pos]) then
                cycle_string = cycle_string .. "( " .. (pos - 1)
                while (p[pos] + 1 ~= i and not visited[p[pos] + 1]) do
                    cycle_string = cycle_string .. ", " .. p[pos]
                    pos = p[pos] + 1
                    visited[pos] = true
                end
                if (p[pos] + 1 == i) then
                    visited[pos] = true
                end
                cycle_string = cycle_string .. " )"
            end
        end
    end
    
    if (cycle_string == "") then 
        cycle_string = "id" .. #p
    end
    
    print(cycle_string)    
end

