scriptName SkyActions_FileSystemListener extends ActiveMagicEffect  
{Listens to the file system for actions to run}

GlobalVariable property SkyActions_FileSystemListenerInterval auto

event OnEffectStart(Actor target, Actor caster)
    RegisterForUpdate(SkyActions_FileSystemListenerInterval.Value)
endEvent

event OnUpdate()
    Debug.MessageBox("Hello " + Utility.GetCurrentRealTime())
endEvent
