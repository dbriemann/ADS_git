local perm = require "permutation"
local group = require "group"

local g1 = {6,7,4,5,2,3,0,1}
local g2 = {1,2,3,0,5,6,7,4}
local g3 = {1,5,6,2,0,4,7,3}

local result = group.gen_cube_group({g1, g2, g3})
local i = 0
for key, value in pairs(result) do
    i = i + 1
    perm.print_cycles(value)
end
print(i)
