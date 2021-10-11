scriptName SkyAction extends Quest
{ TODO DOCUMENTATION }

int CurrentInvocationData

string property ActionName auto

; User initialization code for this action
event OnActionInit()
    ; Meant to be overriden by the mod author
endEvent

; Registers Sky Action
event OnInit()
    OnActionInit()
    SkyActions.RegisterAction(ActionName, self)
endEvent

; Run this action
event OnAction()
    ; Meant to be overriden by the mod author
endEvent

function InvokeAction(int actionData)
    CurrentInvocationData = actionData
    OnAction()
endFunction

string property MessageText
    string function get()
        return JMap.getStr(CurrentInvocationData, "message")
    endFunction
endProperty

string function GetString(string keyName)
    return JMap.getStr(JMap.getObj(CurrentInvocationData, "data"), keyName)
endFunction

int function GetInt(string keyName)
    return JMap.getInt(JMap.getObj(CurrentInvocationData, "data"), keyName)
endFunction
