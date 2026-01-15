return function(enabled)
    hook.Remove("PostDrawOpaqueRenderables", "BoneESP")
    if not enabled then return end

    hook.Add("PostDrawOpaqueRenderables", "BoneESP", function()
        for _, ply in ipairs(player.GetAll()) do
            if ply == LocalPlayer() then continue end
            for i = 0, ply:GetBoneCount()-1 do
                local pos, ang = ply:GetBonePosition(i)
                render.SetColorMaterial()
                render.DrawSphere(pos, 2, 6, 6, Color(0,0,255))
            end
        end
    end)
end
