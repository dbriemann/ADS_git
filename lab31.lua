local perm = require "permutation"
local group = require "group"

local s4e = {{0,1,2,3},{0,3,2,1},{0,2,1,3},{0,1,3,2},{0,2,3,1}}
local pi0 = {0,1,2,3}
local pi1 = {1,0,2,3}
local pi2 = {2,1,0,3}
local pi3 = {3,1,2,0}
local o0, o1, o2, o3 = {}, {}, {}, {}

print("stabilisator\n")
for _, p in pairs(group.gen_group(s4e)) do
    perm.print_cycles(p)
end

for _, p in pairs(group.gen_group(s4e)) do
    table.insert(o0, perm.mult_permutations(pi0, p))
    table.insert(o1, perm.mult_permutations(pi1, p))
    table.insert(o2, perm.mult_permutations(pi2, p))
    table.insert(o3, perm.mult_permutations(pi3, p))
end


print("pi0 * stabilisator\n")
for _, p in ipairs(o0) do
    perm.print_cycles(p)
end

print("pi1 * stabilisator\n")
for _, p in ipairs(o1) do
    perm.print_cycles(p)
end

print("pi2 * stabilisator\n")
for _, p in ipairs(o2) do
    perm.print_cycles(p)
end

print("pi3 * stabilisator\n")
for _, p in ipairs(o3) do
    perm.print_cycles(p)
end

