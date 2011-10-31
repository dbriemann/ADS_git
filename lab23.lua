
local perm = require "permutation"
local group = require "group"

--D5 generators
local pi_d5 = {1,2,3,4,0}
local rho_d5 = {0,4,3,2,1}

local dieder5 = group.gen_dieder_group(5, pi_d5, rho_d5)

print("Dieder group for n=5")
for _,p in ipairs(dieder5) do
    perm.print_cycles(p)
end

--D6 generators
local pi_d6 = {1,2,3,4,5,0}
local rho_d6 = {0,5,4,3,2,1}

local dieder6 = group.gen_dieder_group(6, pi_d6, rho_d6)

print("Dieder group for n=6")
for _,p in ipairs(dieder6) do
    perm.print_cycles(p)
end
