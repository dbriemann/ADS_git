
module(..., package.seeall);

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

function print_permuation(p)
    local p_copy = utils.deepcopy(p)
    local cycle_string = ""
    
    if (#p_copy > 1) then
        for i,v in ipairs(p_copy) do
            pos = i
            if (v + 1 ~= pos and v ~= -1) then
                cycle_string = cycle_string .. "( " .. (pos - 1)
                local tmp = 0
                while (p_copy[pos] + 1 ~= i and p_copy[pos] ~= -1 ) do
                    cycle_string = cycle_string .. ", " .. p_copy[pos]
                    tmp = p_copy[pos]
                    p_copy[pos] = -1
                    pos = tmp + 1
                end
                if (p_copy[pos] + 1 == i) then
                    p_copy[pos] = -1
                end
                cycle_string = cycle_string .. " )"
            end
        end
    end
    
    if (cycle_string == "") then 
        cycle_string = "id" .. #p_copy
    end
    
    print(cycle_string)
end
