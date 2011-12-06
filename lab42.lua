
local cycles = require "cycle_types"
local utils = require "utils"
local perm = require "permutation"
local gr = require "graph"


for n = 3,8 do
    local edges = gr.permute_set(n)
    local partitions = cycles.create_partitions(n)
    local ctypes = {}
    local index = n
    local no_of_classes = 0
    
    print("N=" .. n)
    
    for k,p in pairs(partitions) do
        --cycles.print_partition(p.p, p.k)
        local ct = cycles.create_cycle_type(p.p, p.k, n)
        table.insert(ctypes, ct)
        --cycles.print_cycle_type(ct)
        local pe = cycles.create_permutation(ct)
        --perm.print_cycles(pe)
        --print ""
        local result = perm.pproject(pe, edges)
        local sum = 0
        for _,r in pairs(result) do
            --for _,entry in ipairs(r) do
            --    utils.printf("{%d, %d} ", entry[1], entry[2])
            --end
            --print("")
            sum = sum + 1
            --print( "SIZE " .. #r)
        end
        --print("SUM: " .. sum )
        
        index = n
        local prod = 1
        for i=1, n do
            --index = index - 1
            prod = prod * math.pow(i, ct[i]) * utils.fac(ct[i])
        end
        
        --print("PROD: " .. prod)
        
        print ("TEMP: " ..  (math.pow(2, sum) / prod))
        no_of_classes = no_of_classes + (math.pow(2, sum) / prod)
    end
    print("TOTAL NO OF CLASSES: " .. no_of_classes)
    print("")
    --
end
