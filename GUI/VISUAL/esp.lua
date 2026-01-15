return function(option)
    hook.Remove("HUDPaint", "ESP_HUD")
    if option == "OFF" then return end

    hook.Add("HUDPaint", "ESP_HUD", function()
        for _, ply in ipairs(player.GetAll()) do
            if ply == LocalPlayer() then continue end
            if option == "Players" or option == "All" then
                local pos = ply:EyePos():ToScreen()
                draw.SimpleText(ply:Nick(), "DermaDefault", pos.x, pos.y, Color(255,0,0), TEXT_ALIGN_CENTER)
            end
        end
        if option == "Props" or option == "All" then
            for _, ent in ipairs(ents.GetAll()) do
                if not ent:IsValid() or ent:IsPlayer() then continue end
                local pos = ent:GetPos():ToScreen()
                draw.SimpleText("Prop", "DermaDefault", pos.x, pos.y, Color(0,255,0), TEXT_ALIGN_CENTER)
            end
        end
    end)
end
