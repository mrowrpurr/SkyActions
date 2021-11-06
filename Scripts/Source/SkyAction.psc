scriptName SkyAction

string function GetParamString(int actionRef, string propertyName, string default = "") global
    int params = JMap.getObj(actionRef, "params")
    if params && JMap.hasKey(params, propertyName)
        return JMap.getStr(params, propertyName)
    else
        return default
    endIf
endFunction

int function GetParamInt(int actionRef, string propertyName, int default = 0) global
    int params = JMap.getObj(actionRef, "params")
    if params && JMap.hasKey(params, propertyName)
        return JMap.getInt(params, propertyName)
    else
        return default
    endIf
endFunction

Form function GetParamForm(int actionRef, string propertyName, Form default = None) global
    int params = JMap.getObj(actionRef, "params")
    if params && JMap.hasKey(params, propertyName)
        return JMap.getForm(params, propertyName)
    else
        return default
    endIf
endFunction
