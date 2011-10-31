
local perm = require "permutation"
local group = require "group"
local utils = require "utils"

-- example permutations
local p1 = {5,4,1,3,2,0}
local p2 = {1,0,3,2,5,4}
local p3 = {0,1,2,3,4,5}

--[[
perm.print_cycles(p1)
utils.printf("no of cycles: " .. perm.count_cycles(p1) .. "\n")
utils.printf("signum: " .. perm.signum(p1) .. "\n")

perm.print_cycles(p2)
utils.printf("no of cycles: " .. perm.count_cycles(p2) .. "\n")
utils.printf("signum: " .. perm.signum(p2) .. "\n")

perm.print_cycles(p3)
utils.printf("no of cycles: " .. perm.count_cycles(p3) .. "\n")
utils.printf("signum: " .. perm.signum(p3) .. "\n")
--]]

local count = 0

print("Permutations of S3 with signum = 1")
for p in group.sym_group_iterator(3) do
    if perm.signum(p) == 1 then
        count = count + 1
        perm.print_cycles(p)
    end
end
print("Amount: " .. count)

count = 0
print("Permutations of S4 with signum = 1")
for p in group.sym_group_iterator(4) do
    if perm.signum(p) == 1 then
        count = count + 1
        perm.print_cycles(p)
    end
end
print("Amount: " .. count)

count = 0
print("Permutations of S5 with signum = 1")
for p in group.sym_group_iterator(5) do
    if perm.signum(p) == 1 then
        count = count + 1
        perm.print_cycles(p)
    end
end
print("Amount: " .. count)

count = 0
print("Permutations of S6 with signum = 1")
for p in group.sym_group_iterator(6) do
    if perm.signum(p) == 1 then
        count = count + 1
        perm.print_cycles(p)
    end
end
print("Amount: " .. count)
