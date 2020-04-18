mod__sentry = class({})


function mod__sentry:IsHidden()
    return true
end

function mod__sentry:OnCreated()
    local parent = self:GetParent()
    self.attack_range_index = ParticleManager:CreateParticle("particles/units/heroes/hero_monkey_king/monkey_king_furarmy_ring_bright.vpcf", PATTACH_ABSORIGIN_FOLLOW, parent)
    ParticleManager:SetParticleControl(self.attack_range_index, 1, Vector(500, 1, 1))
    self:StartIntervalThink(1)
end

function mod__sentry:OnIntervalThink()
    if not IsServer() then
        return
    end

    local parent = self:GetParent()
    local hero_in_range = Entities:FindByClassnameWithin(nil, "npc_dota_hero_rubick", parent:GetOrigin(), 3000)
    if hero_in_range then
        AddFOWViewer(DOTA_TEAM_GOODGUYS, parent:GetOrigin(), 500, 1.1, true)
    end
end

function mod__sentry:CheckState()
    return {
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_UNSELECTABLE] = true
    }
end