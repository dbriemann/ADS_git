
require "utils"
local perm = require "permutation"



p1 = {5,4,1,3,2,0}
p2 = {1,0,3,2,5,4}
p3 = {0,1,2,3,4,5}

perm.print_permuation(p1)
perm.print_permuation(p2)
perm.print_permuation(p3)
perm.print_permuation(perm.mult_permutations(p1, p2))
perm.print_permuation(perm.invert_permutation(p1))
