require("utils")
LinkLuaModifier("mod__just_teleported", "modifiers/mod__just_teleported", LUA_MODIFIER_MOTION_NONE)
mod__orb_dropped = class({})


function mod__orb_dropped:OnCreated()
    self:StartIntervalThink(1)
end

function mod__orb_dropped:OnIntervalThink()
    if not IsServer() then
        return
    end

    AddFOWViewer(DOTA_TEAM_GOODGUYS, self:GetParent().orb:GetOrigin(), 10, 1.1, true)
end

function mod__orb_dropped:TeleportToOrb()
    if not IsServer() then
        return
    end

    local parent = self:GetParent()
    parent:AddNewModifier(parent, self, "mod__just_teleported", { duration = 1.0 })
    parent:SetOrigin(parent.orb:GetOrigin())
    parent:PickupDroppedItem(parent.orb:GetContainer())

    local index = ParticleManager:CreateParticle("particles/econ/items/wisp/wisp_relocate_teleport_ti7.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(index, 0, parent:GetOrigin())
    ParticleManager:SetParticleControl(index, 1, parent:GetOrigin())
    ParticleManager:ReleaseParticleIndex(index)
end

function mod__orb_dropped:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_DEATH
    }
end

function mod__orb_dropped:OnDeath(keys)
    if not IsServer() then
        return
    end

    local parent = self:GetParent()

    if keys.unit == parent then
        local index = ParticleManager:CreateParticle("particles/econ/items/wisp/wisp_relocate_teleport_ti7.vpcf", PATTACH_WORLDORIGIN, parent.orb)
        ParticleManager:SetParticleControl(index, 0, parent.orb:GetOrigin())
        ParticleManager:SetParticleControl(index, 1, parent.orb:GetOrigin())
        ParticleManager:ReleaseParticleIndex(index)

        if parent:GetNumItemsInInventory() < 6 then
            local orb_name = parent.orb:GetName()

            parent.orb:GetContainer():RemoveSelf()
            parent.orb:RemoveSelf()

            local new_orb = parent:AddItemByName(orb_name)
            new_orb.owner = parent
        else
            local spawn_point = GetSpawnHandle(parent)
            parent.orb:SetOrigin(spawn_point)
            parent.orb:GetContainer():SetOrigin(spawn_point)
        end

        UTIL_Remove(self)
    end
end