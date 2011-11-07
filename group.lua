
local perm = require "permutation"
local utils = require "utils"

module(..., package.seeall);

local function generate_symmetric_group(p, n)
    if n <= 1 then
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
    return coroutine.wrap(function () gen_sym(n) end)
end

function gen_dieder_group(n, pi, rho)
    local result = {}
    local pis = {pi}
    local rhos = {rho}
    
    --add pis
    for i=2, n do
        table.insert(pis, perm.mult_permutations(pis[1], pis[i-1]))
        table.insert(rhos, perm.mult_permutations(rhos[1], pis[i-1]))
    end
    
    for i=1, n do
        table.insert(result, pis[i])
    end
    
    for i=1, n do
        table.insert(result, rhos[i])
    end
    
    return result
end

function gen_cube_group(generators)
    local result = {}
    local new_element = false
    
    for i=1, #generators do
        local g = generators[i]
        result[perm.to_string(g)] = g
    end
    
    repeat
        local tmp = utils.deepcopy(result)
        new_element = false
        for h1, g1 in pairs(tmp) do
            for h2, g2 in pairs(tmp) do
                local mult = perm.mult_permutations(g1, g2)
                local hash = perm.to_string(mult)
                if result[hash] == nil then
                    result[hash] = mult
                    new_element = true
                end         
            end 
        end
    until not new_element
    
    return result
end
