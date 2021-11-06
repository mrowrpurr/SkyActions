scriptName SkyAction

function PerformAction(int actionRef) global
    string actionName = JMap.getStr(actionRef, "action")
    int    params     = JMap.getObj(actionRef, "params")

    string text = "Action: " + actionName + "\n"
    string[] paramNames = JMap.allKeysPArray(params)
    text += "Param Count: " + paramNames.Length + "\n"
    int i = 0
    while i < paramNames.Length
        string paramName = paramNames[i]
        int valueType = JMap.valueType(params, paramName)
        if valueType == 2
            text += paramName + " is type: " + valueType + " Value: " + JMap.getInt(params, paramName) + " [" + JMap.getStr(params, paramName) + "]\n"
        else
            text += paramName + " is type: " + valueType + "\n"
        endIf
        i += 1
    endWhile
    Debug.MessageBox(text)
endFunction
