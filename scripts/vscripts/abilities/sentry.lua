LinkLuaModifier("mod__sentry", "modifiers/mod__sentry", LUA_MODIFIER_MOTION_NONE)
sentry = class({})


function sentry:IsHidden()
    return true
end

function sentry:GetIntrinsicModifierName()
    return "mod__sentry"
end