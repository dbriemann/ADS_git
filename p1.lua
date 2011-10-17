
local perm = require "permutation"
local group = require "group"

-- example permutations
local p1 = {5,4,1,3,2,0}
local p2 = {1,0,3,2,5,4}
local p3 = {0,1,2,3,4,5}

-- testing
-- 1) print permutation
-- 2) multiply permutation
-- 3) invert permutation
print()
print("p1 = {5,4,1,3,2,0} in cycle notation --> ")
perm.print_cycles(p1)
print()
print("p2 = {1,0,3,2,5,4} in cycle notation -->")
perm.print_cycles(p2)
print()
print("p3 = {0,1,2,3,4,5} in cycle notation -->")
perm.print_cycles(p3)
print()
print("p1 * p2 -->")
perm.print_cycles(perm.mult_permutations(p1, p2))
print()
print("invert(p1) -->")
perm.print_cycles(perm.invert_permutation(p1))

-- testing
-- symmetric group generation
print()
print("Symmetric group for n = 3")
for p in group.sym_group_iterator(3) do
    perm.print_cycles(p)
end
print()
print("Symmetric group for n = 4")
for p in group.sym_group_iterator(4) do
    perm.print_cycles(p)
end
print()
print("Symmetric group for n = 5")
for p in group.sym_group_iterator(5) do
    perm.print_cycles(p)
end
print()
print("Symmetric group for n = 6")
for p in group.sym_group_iterator(6) do
    perm.print_cycles(p)
end
