
local cycles = require "cycle_types"
local utils = require "utils"
local perm = require "permutation"

local n = 5

local partitions = cycles.create_partitions(n)


for k,p in pairs(partitions) do
    local pp = p.p
    local kk = p.k
    cycles.print_partition(pp, kk)
    utils.printf("  -->  ")
    local cycle_type = cycles.create_cycle_type(pp,kk,n)
    cycles.print_cycle_type(cycle_type)
    local pe = cycles.create_permutation(cycle_type)
    utils.printf("  -->  ")
    perm.print_cycles(pe)
    utils.printf("\n")
end

