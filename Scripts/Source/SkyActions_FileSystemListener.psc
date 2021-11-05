scriptName SkyActions_FileSystemListener extends ActiveMagicEffect  
{Listens to the file system for actions to run}

SkyActions property API auto
GlobalVariable property SkyActions_FileSystemListenerInterval auto

event OnEffectStart(Actor target, Actor caster)
    RegisterForSingleUpdate(SkyActions_FileSystemListenerInterval.Value)
endEvent

event OnUpdate()
    ; Debug.MessageBox("API: " + API)
    JValue.writeToFile(API.SaveGameData, "SkyActions_SaveGameData.json")

    int files = JValue.readFromDirectory(API.FileSystemListenerPath)
    JValue.retain(files)
    string[] fileNames = JMap.allKeysPArray(files)
    int i = 0
    while i < fileNames.Length
        string fileName = fileNames[i]
        int file = JMap.getObj(files, fileName)
        if ! JMap.getStr(file, "completed") == "true"
            string actionName = JMap.getStr(file, "actionName")
            if API.ActionExists(actionName)
                SkyAction actionScript = SkyActions.GetSkyAction(actionName)
                actionScript.InvokeAction(file)
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
    JValue.release(files)
    RegisterForSingleUpdate(SkyActions_FileSystemListenerInterval.Value)
endEvent
