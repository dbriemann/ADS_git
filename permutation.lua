module(..., package.seeall);

require "utils"
require "math"

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

function count_cycles(p)
    local visited = {}
    local result = 0
    
    for i=1, #p do
        local pos = i
        local check = false
        while not visited[pos] do
            check = true
            visited[pos] = true
            pos = p[pos] + 1            
        end
        if check then result = result + 1 end
    end
    
    return result
end

function signum(p)
    local cycles = count_cycles(p)
    local exponent = #p - cycles
    return math.pow(-1, exponent)
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


function to_string(perm)
    local str = ""

    for i=1, #perm do
        str = str .. perm[i]
    end
    
    return str
end

function project(perm, graph)
    local g = {}
    
    for _, edge in pairs(graph) do
        local i = perm[edge[1] + 1]
        local j = perm[edge[2] + 1]
        local ij = {i, j}
        table.sort(ij)
        table.insert(g, ij)
    end
    
    return g
end

function pproject(perm, edges)
    local redges = {}    
    local hit = {}
    local stack = {}
    
    for _,e in pairs(edges) do
        table.insert(stack, e)
    end
    
    local count = 1
    while #stack > 0 do
        local e = table.remove(stack, #stack)
        local r = project(perm, {e})[1]
        local hash = r[1] .. r[2]
        if not hit[hash] then
            if not redges[count] then
                redges[count] = {}
            end            
            table.insert(redges[count], r) 
            hit[hash] = true
            table.insert(stack, r)
        else
            count = count + 1
        end
    end
  
    return redges
end
