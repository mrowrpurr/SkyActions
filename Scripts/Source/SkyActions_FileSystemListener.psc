scriptName SkyActions_FileSystemListener extends ActiveMagicEffect  
{Listens to the file system for actions to run}

SkyActions property API auto
GlobalVariable property SkyActions_FileSystemListenerInterval auto

event OnEffectStart(Actor target, Actor caster)
    RegisterForSingleUpdate(SkyActions_FileSystemListenerInterval.Value)
endEvent

event OnUpdate()
    int files = JValue.readFromDirectory(API.FileSystemListenerPath)
    string[] fileNames = JMap.allKeysPArray(files)
    int i = 0
    while i < fileNames.Length
        string fileName = fileNames[i]
        int file = JMap.getObj(files, fileName)
        if ! JMap.getStr(file, "completed") == "true"
            string actionName = JMap.getStr(file, "actionName")
            if API.ActionExists(actionName)
                SkyAction actionScript = SkyActions.GetSkyAction(actionName)
                actionScript.OnAction()
            else
                SkyActions.Log("Action type not found: " + actionName)
                JMap.setStr(file, "failed", "true")
                JMap.setStr(file, "failureMessage", "Action type not found: " + actionName)
            endIf
            JMap.setStr(file, "completed", "true")
            JValue.writeToFile(file, API.FileSystemListenerPath + "/" + fileName)
        endIf
        i += 1
    endWhile
    RegisterForSingleUpdate(SkyActions_FileSystemListenerInterval.Value)
endEvent
