return function(enabled)
    hook.Remove("CalcView", "ThirdPersonCam")
    if enabled then
        hook.Add("CalcView", "ThirdPersonCam", function(ply, pos, angles, fov)
            local view = {}
            view.origin = pos - angles:Forward() * 100 + Vector(0,0,10)
            view.angles = angles
            view.fov = fov
            return view
        end)
    end
end
