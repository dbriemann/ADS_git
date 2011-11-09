local perm = require "permutation"
local group = require "group"

local g1 = {2,3,0,1}
local g2 = {1,0,3,2}

local result = group.gen_group({g1, g2})
local i = 0
for key, value in pairs(result) do
    i = i + 1
    perm.print_cycles(value)
end
print(i)
