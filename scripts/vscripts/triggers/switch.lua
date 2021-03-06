function OnStartTouch(trigger)
    if IsServer() then
        print("Switch trigger entered")
        local hero_index = trigger.activator:GetEntityIndex()
        local hero = EntIndexToHScript(hero_index)

        hero.respawn_point = thisEntity:GetOrigin()
        hero.respawn_unit:SetOrigin(hero.respawn_point)
        EmitSoundOn("Hero_Techies.RemoteMine.Detonate", thisEntity)
    end
end

function OnStartTouch_Explosion(trigger)
    if IsServer() then
        EmitSoundOn("Hero_Techies.RemoteMine.Detonate", thisEntity)
    end
end