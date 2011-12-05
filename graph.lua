module(..., package.seeall);

function permute_set(n) 
    local set = {}

    for i=0, n-1 do
        for j=0, n-1 do
            if i ~= j then 
                local s = {i, j}
                table.sort(s)
                set[s[1]..s[2]] = s
            end
        end
    end

    return set    
end
