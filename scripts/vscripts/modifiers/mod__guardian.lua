mod__guardian = class({})


function mod__guardian:IsHidden()
    return true
end

function mod__guardian:OnCreated()
    self:StartIntervalThink(1)
end

function mod__guardian:OnIntervalThink()
    if not IsServer() then
        return
    end

    local parent = self:GetParent()
    local hero_in_range = Entities:FindByClassnameWithin(nil, "npc_dota_hero_rubick", parent:GetOrigin(), 3000)
    if hero_in_range then
        AddFOWViewer(DOTA_TEAM_GOODGUYS, parent:GetOrigin(), 225, 1.1, true)
    end
end

function mod__guardian:CheckState()
    return {
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_UNSELECTABLE] = true
    }
end