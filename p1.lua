
local perm = require "permutation"


-- example permutations
p1 = {5,4,1,3,2,0}
p2 = {1,0,3,2,5,4}
p3 = {0,1,2,3,4,5}

-- testing
-- 1) print permutation
-- 2) multiply permutation
-- 3) invert permutation
perm.print_cycles(p1)
perm.print_cycles(p2)
perm.print_cycles(p3)
perm.print_cycles(perm.mult_permutations(p1, p2))
perm.print_cycles(perm.invert_permutation(p1))

--perm.print_permuation(p1)
--perm.print_permuation(p2)
--perm.print_permuation(p3)
--perm.print_permuation(perm.mult_permutations(p1, p2))
--perm.print_permuation(perm.invert_permutation(p1))
