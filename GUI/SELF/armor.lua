return function(node)
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    node.value = ply:Armor()
end
