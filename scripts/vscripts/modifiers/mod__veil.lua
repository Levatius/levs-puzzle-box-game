mod__veil = class({})


function mod__veil:OnCreated()
    if not IsServer() then
        return
    end

    local parent = self:GetParent()

    EmitSoundOn("Hero_Riki.Invisibility", parent)

    self.start_index = ParticleManager:CreateParticle("particles/generic_hero_status/status_invisibility_start.vpcf", PATTACH_ABSORIGIN, parent)
    ParticleManager:SetParticleControl(self.start_index, 0, parent:GetOrigin())
    ParticleManager:ReleaseParticleIndex(self.start_index)
end

function mod__veil:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INVISIBILITY_LEVEL
    }
end

function mod__veil:GetModifierInvisibilityLevel()
    return 1
end

function mod__veil:CheckState()
    return {
        [MODIFIER_STATE_INVISIBLE] = true
    }
end