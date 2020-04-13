function GetSpawnHandle(npc)
    if npc.banner then
        return npc.banner:GetOrigin()
    elseif npc.respawn_point then
        return npc.respawn_point
    else
        return nil
    end
end