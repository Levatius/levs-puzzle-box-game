function OnStartTouch(trigger)
    local hero = EntIndexToHScript(trigger.activator:GetEntityIndex())
    if not hero:HasModifier("mod__just_teleported") then
        print("Veil button entered")

        local heroes = Entities:FindAllByClassname("npc_dota_hero_rubick")
        for _, hero in pairs(heroes) do
            local veil = hero:FindItemInInventory("item_veil")
            if veil then
                veil:RemoveSelf()
            end
        end

        local drops = Entities:FindAllByClassname("dota_item_drop")
        for _, drop in pairs(drops) do
            if drop:GetContainedItem():GetName() == "item_veil" then
                local index = ParticleManager:CreateParticle("particles/econ/items/wisp/wisp_relocate_teleport_ti7.vpcf", PATTACH_WORLDORIGIN, hero)
                ParticleManager:SetParticleControl(index, 0, drop:GetOrigin())
                ParticleManager:SetParticleControl(index, 1, drop:GetOrigin())
                ParticleManager:ReleaseParticleIndex(index)
                drop:GetContainedItem():RemoveSelf()
                drop:RemoveSelf()
            end
        end

        hero:AddItemByName("item_veil")

        local index = ParticleManager:CreateParticle("particles/econ/items/luna/luna_lucent_ti5_gold/luna_eclipse_cast_moonfall_gold.vpcf", PATTACH_ABSORIGIN_FOLLOW, hero)
        ParticleManager:SetParticleControl(index, 0, hero:GetOrigin())
        ParticleManager:ReleaseParticleIndex(index)
    end
end
