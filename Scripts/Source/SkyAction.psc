scriptName SkyAction extends Quest
{ TODO DOCUMENTATION }

string ActionName property auto

; User initialization code for this action
event OnActionInit()
    ; Meant to be overriden by the mod author
endEvent

; Registers Sky Action
event OnInit()
    OnActionInit()
    SkyActions.RegisterAction(ActionName, self)
endEvent
