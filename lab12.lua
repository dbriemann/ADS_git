
local perm = require "permutation"
local group = require "group"


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
