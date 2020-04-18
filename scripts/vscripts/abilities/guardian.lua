LinkLuaModifier("mod__guardian", "modifiers/mod__guardian", LUA_MODIFIER_MOTION_NONE)
guardian = class({})


function guardian:IsHidden()
    return true
end

function guardian:GetIntrinsicModifierName()
    return "mod__guardian"
end