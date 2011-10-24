
require "utils"

module(..., package.seeall);

function create_partitions(n)
    local result = {}
    local temp = {}
    
    local function gen_partitions(n, bound, k)
        if n == 0 then table.insert(result, {k=k, p=utils.deepcopy(temp)}) --print_ct(temp, k-1) 
        else
            for i=1, math.min(bound,n) do
                temp[k+1] = i
                gen_partitions(n-i, i, k+1)
            end
        end
    end
    
    gen_partitions(n, n, 0)
   
    return result
end

function create_cycle_type(partition, k, size)
    local result = {}    
    for i=1,size do
        table.insert(result, 0)
    end
    
    for i=1,k do
        result[partition[i]] = result[partition[i]] + 1
    end
    
    return result
end

function create_permutation(ct)
    local perm = {}
    local current = 0
    
    for len,amount in ipairs(ct) do
        for i=1,amount do 
            local start = current
            for j=1,len-1 do
                perm[current+1] = current+1
                current = current + 1
            end
            perm[current+1] = start
            current = current + 1 
        end
    end    
    
    return perm
end

function print_cycle_type(ct)
    utils.printf("[ ")
    for _,e in ipairs(ct) do
        utils.printf(e .. " ")
    end
    utils.printf("]")
end

function print_partition(p, k)
    utils.printf("( ")
    for i=1,k do
        utils.printf(p[i] .. " ")
    end
    utils.printf(")")
end
