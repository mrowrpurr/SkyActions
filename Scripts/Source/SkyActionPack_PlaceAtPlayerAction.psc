scriptName SkyActionPack_PlaceAtPlayerAction extends SkyAction

event OnActionInit()
    ActionName = "placeat"
endEvent

event OnAction()
    Game.GetPlayer().PlaceAtMe(Game.GetForm(0x10982B))
endEvent
