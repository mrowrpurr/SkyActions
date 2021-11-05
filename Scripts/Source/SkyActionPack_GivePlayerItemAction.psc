scriptName SkyActionPack_GivePlayerItemAction extends SkyAction

event OnActionInit()
    ActionName = "giveitem"
endEvent

event OnAction()
    Form theForm = ProvidedForm
    if theForm
        Debug.Messagebox(GetString("username") + " placed " + \
            GetInt("count") + "x " + theForm.GetName() + " at player")
        Game.GetPlayer().AddItem(theForm, GetInt("count"))
    else
        Debug.MessageBox("Sorry " + GetString("username") + ", but the item number " + GetString("item") + " did not work. :(")
    endIF
endEvent

Form property ProvidedForm
    Form function get()
        return FormHelper.HexToForm(GetString("item"))
    endFunction
endProperty
