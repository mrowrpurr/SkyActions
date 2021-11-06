scriptName SkyActions

; JContainer Types
;
; > 2: int (or bool)
; > 3: float
; > 4: form
; > 5: object
; > 6: string

string function GetSkseModEventNameForAction(string actionName, string namespace = "") global
    if namespace
        return "SkyAction_Event_" + namespace + "_" + actionName
    else
        return "SkyAction_Event_" + actionName
    endIf
endFunction

function PerformAction(int actionRef, string namespace = "") global
    string actionName   = JMap.getStr(actionRef, "action")
    int theEvent        = ModEvent.Create(GetSkseModEventNameForAction(actionName, namespace))
    ModEvent.PushInt(theEvent, actionRef)
    ModEvent.Send(theEvent)
endFunction

function ListenForAction_Form(Form listener, string actionName, string namespace = "", string callback = "") global
    if ! callback
        callback = "On" + actionName
    endIf
    listener.RegisterForModEvent(GetSkseModEventNameForAction(actionName, namespace), callback)
endFunction

function ListenForAction_Alias(Alias listener, string actionName, string namespace = "", string callback = "") global
    if ! callback
        callback = "On" + actionName
    endIf
    listener.RegisterForModEvent(GetSkseModEventNameForAction(actionName, namespace), callback)
endFunction

function ListenForAction_AME(ActiveMagicEffect listener, string actionName, string namespace = "", string callback = "") global
    if ! callback
        callback = "On" + actionName
    endIf
    listener.RegisterForModEvent(GetSkseModEventNameForAction(actionName, namespace), callback)
endFunction
