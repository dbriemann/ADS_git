
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
    print "DÜDDEDLDÜ"
    return {}
end


function projset(perm, set)
    local s = {}
    
    for _, element in pairs(set) do
        local newel = perm[set[1] + 1]
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
            table.insert(result, r)
        end
    end
    
    return result
end

local id4 = {0,1,2,3}
local pi = {1,2,3,0}
local delta = {1,0,3,2}
local pi2 = perm.mult_permutations(pi,pi)
local pi3 = perm.mult_permutations(pi,pi2)
print("PI^3 ")
perm.print_cycles(pi3)

local bahn_0 = {{set={0}, perm=id4}, {set={1}, perm=pi}, {set={2}, perm=pi2}, {set={3}, perm=pi3}}
local gens = {pi, delta}

local stab = generatorsOfStab(bahn_0, gens, {0})
for _,s in ipairs(stab) do
    print(perm.print_cycles(s))
end
