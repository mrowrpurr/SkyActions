scriptName SkyActionsUI_ShowUI extends ActiveMagicEffect  
{Spell which shows the Sky Actions UI}

SkyActionsUI property UI auto

event OnEffectStart(Actor target, Actor caster)
    UI.ShowUI()
endEvent
