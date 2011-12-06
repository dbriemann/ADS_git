
local perm = require "permutation"

local g = {{}, {}}

local function areSetsEqual(set1, set2) 
    if #set1 ~= #set2 then
        return false
    else
        for i=1,#set1 do
            if set1[i] ~= set2[i] then
                return false
            end
        end
    end
    return true
end

local function getPermOfSetInPairList(set, pairlist)
    for _,pair in ipairs(pairlist) do
        if areSetsEqual(set, pair.set) then
            return pair.perm
        end
    end

    return {}
end


function projset(perm, set)
    local s = {}
    
    for _, element in pairs(set) do
        local newel = perm[element + 1]
        table.insert(s, newel)
    end
    
    table.sort(s)
    return s
end


local function generatorsOfStab(bahn, generators, x)
    local result = {}
    
    for _,pair in ipairs(bahn) do
        for _,gen in ipairs(generators) do
            local x_2 = projset(gen, pair.set) 
            local t_1 = getPermOfSetInPairList(x_2, bahn)
            local t_1i = perm.invert_permutation(t_1)
            local prod = perm.mult_permutations(gen, pair.perm)--, gen)
            local r = perm.mult_permutations(t_1i, prod)--, t_1i)
            local is_new = true
            for _, r2 in ipairs(result) do
                if areSetsEqual(r, r2) then
                    is_new = false
                    break
                end
            end
            
            if is_new then              
                table.insert(result, r)
            end
        end
    end
    
    return result
end

function table.to_string(t)
    local result = "{ "
        
    for _, v in pairs(t) do
        result = result .. v .. " " 
    end
    result = result .. "}"
    return result
end


local id4 = {0,1,2,3}
local pi = {1,2,3,0}
local delta = {1,0,3,2}
local pi2 = perm.mult_permutations(pi,pi)
local pi3 = perm.mult_permutations(pi,pi2)

local bahn_0 = {{set={0}, perm=id4}, {set={1}, perm=pi}, {set={2}, perm=pi2}, {set={3}, perm=pi3}}
local bahn_e = {{set={}, perm=id4}}
local bahn_0123 = {{set={0,1,2,3}, perm=id4}}
local bahn_01 = {{set={0,1}, perm=id4}, {set={1,2}, perm=pi}, {set={2,3}, perm=pi2}, {set={0,3}, perm=pi3}}
local bahn_012 = {{set={0,1,2}, perm=id4}, {set={1,2,3}, perm=pi}, {set={0,2,3}, perm=pi2}, {set={0,1,3}, perm=pi3}}
local bahn_02 = {{set={0,2}, perm=id4}, {set={1,3}, perm=pi}}

local bahnen = {bahn_0, bahn_e, bahn_0123, bahn_01, bahn_012, bahn_02}

local gens = {pi, delta}


for _,b in ipairs(bahnen) do
    print("Stabilisator von " .. table.to_string(b[1].set))
    local str = "< "
    local stab = generatorsOfStab(b, gens, b[1].set)
    for _,s in ipairs(stab) do
        str = str .. perm.to_cycles(s) .. " "
    end
    
    str = str .. ">"
    print(str)
end
