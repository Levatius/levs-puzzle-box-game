item_nightlock_mango = class({})


function item_nightlock_mango:OnSpellStart()
    if not IsServer() then
        return
    end

    local caster = self:GetCaster()

    EmitSoundOn("Item.MoonShard.Consume", caster)
    local damage = {
        victim = caster,
        attacker = caster,
        damage = 322,
        damage_type = DAMAGE_TYPE_PURE,
        ability = self
    }
    ApplyDamage(damage)
end
