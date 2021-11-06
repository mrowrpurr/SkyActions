scriptName SkyActions_StandardActionLibrary extends ReferenceAlias  
{Standard Library of Actions which come with the SkyActions Framework}

event OnInit()
    ListenForActions()  
endEvent

event OnPlayerLoadGame()
    ListenForActions()    
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Action Registration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function ListenForActions()
    SkyActions.ListenForAction_Alias(self, "PlaceAtPlayer")
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Actions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

event OnPlaceAtPlayer(int actionRef)
    int count = SkyAction.GetParamInt(actionRef, "count", default = 1)
    Form theForm = SkyAction.GetParamForm(actionRef, "form")
    GetActorReference().PlaceAtMe(theForm, count)
endEvent
