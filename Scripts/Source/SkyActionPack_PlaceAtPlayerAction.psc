scriptName SkyActionPack_PlaceAtPlayerAction extends SkyAction

event OnActionInit()
    ActionName = "placeat"
endEvent

event OnAction()
    Form theForm = ProvidedForm
    Actor formAsActor = theForm as Actor
    if formAsActor
        theForm = formAsActor.GetActorBase()
    endIf
    if theForm
        Debug.Messagebox(GetString("username") + " placed " + \
            GetInt("count") + "x " + theForm.GetName() + " at player")
        Game.GetPlayer().PlaceAtMe(theForm, GetInt("count"))
    else
        Debug.MessageBox("Sorry " + GetString("username") + ", but the item number " + GetString("item") + " did not work. :(")
    endIF
endEvent

Form property ProvidedForm
    Form function get()
        return FormHelper.HexToForm(GetString("item"))
    endFunction
endProperty
