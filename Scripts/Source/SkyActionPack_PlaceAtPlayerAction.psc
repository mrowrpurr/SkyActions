scriptName SkyActionPack_PlaceAtPlayerAction extends SkyAction

event OnActionInit()
    ActionName = "placeat"
endEvent

event OnAction()
    if ProvidedForm
        Debug.Messagebox(GetString("username") + " placed " + \
            GetInt("count") + "x " + ProvidedForm.GetName() + " at player")
        Game.GetPlayer().PlaceAtMe(ProvidedForm, GetInt("count"))
    else
        Debug.MessageBox("Sorry " + GetString("username") + ", but the item number " + GetString("item") + " did not work. :(")
    endIF
endEvent

Form property ProvidedForm
    Form function get()
        return FormHelper.HexToForm(GetString("item"))
    endFunction
endProperty
