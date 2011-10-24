
local perm = require "permutation"

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

--TODO inverse und mult.
-- assoziativ
