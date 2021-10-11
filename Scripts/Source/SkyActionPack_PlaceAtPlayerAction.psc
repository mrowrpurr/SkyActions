scriptName SkyActionPack_PlaceAtPlayerAction extends SkyAction

event OnActionInit()
    ActionName = "placeat"
endEvent

event RunAction()
    Game.GetPlayer().PlaceAtMe(Game.GetForm(0x10982B))
endEvent
