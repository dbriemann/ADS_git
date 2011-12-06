local perm = require "permutation"
local group = require "group"
local gr = require "graph"
local utils = require "utils"

local pi = {2,1,0,3}

print ('G=<pi>')
local G = group.gen_group({pi})
for _, p in pairs(G) do
    perm.print_cycles(p)
end

local graph = {{0, 1}, {0, 3}, {1, 3}}

for _, p in pairs(G) do
    local r = perm.project(p, graph)

    print('graph')
    for _, edge in pairs(r) do
        print(edge[1] .. ' ' .. edge[2])
    end
end

print 'edges'
local n = 4
local f = gr.permute_set(n)
for _, arr in pairs(f) do
    print(arr[1] .. ' ' .. arr[2])
end

print 'bahn'
local pi1 = {0,1,2,3}
local pi2 = {1,0,2,3}
local pi3 = {1,0,3,2}
local pi4 = {1,2,0,3}
local pi5 = {1,2,3,0}

local pis = {pi1,pi2,pi3,pi4,pi5}
local n = 4

local edges = gr.permute_set(n)

for _,pix in ipairs(pis) do
    for _, p in pairs({pix}) do
        print('<')
        perm.print_cycles(p)
        print('> \\\\ G' .. n)
        local result = perm.pproject(p, edges)
        for _,r in pairs(result) do
            for _,entry in ipairs(r) do
                utils.printf("{%d, %d} ", entry[1], entry[2])
            end
            print("")
        end
    end
end

