scriptName SkyAction extends Quest
{ TODO DOCUMENTATION }

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
event RunAction()
    ; Meant to be overriden by the mod author
endEvent
