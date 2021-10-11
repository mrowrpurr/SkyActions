scriptName SkyActionPack_RainAction extends SkyAction

ObjectReference property SpawnMarker     auto
ObjectReference property PlacementMarker auto

event OnActionInit()
    ActionName = "rain"
endEvent

event OnAction()
    Actor player     = Game.GetPlayer()
    Form catForm     = Game.GetFormFromFile(0x1b47f, "ACatsLife.esp")
    Form dogForm     = Game.GetForm(0x23A92)
    Form giantForm   = Game.GetForm(0x23AAE)
    Form mysteryForm = Game.GetForm(0x12EB7)

    ; Debug.MessageBox(Username + " is making it rain cats and dogs!")

    int i = 0
    while i < 300

        ObjectReference mystery = SpawnMarker.PlaceAtMe(mysteryForm)
        float x = Utility.RandomFloat(-300, 300)
        float y = Utility.RandomFloat(-300, 300)
        float z = Utility.RandomFloat(200, 600)
        PlacementMarker.MoveTo(player, afXOffset = x, afYOffset = y, afZOffset = z)
        mystery.MoveTo(PlacementMarker)
        mystery.MoveTo(PlacementMarker)

        ; Actor giant = SpawnMarker.PlaceAtMe(giantForm) as Actor
        ; giant.SetActorValue("Health", 10000)
        ; float x = Utility.RandomFloat(-800, 800)
        ; float y = Utility.RandomFloat(-800, 800)
        ; float z = Utility.RandomFloat(800, 1000)
        ; PlacementMarker.MoveTo(player, afXOffset = x, afYOffset = y, afZOffset = z)
        ; giant.MoveTo(PlacementMarker)
        ; giant.MoveTo(PlacementMarker)

        ; Actor cat = SpawnMarker.PlaceAtMe(catForm) as Actor
        ; cat.SetActorValue("Health", 10000)
        ; float x = Utility.RandomFloat(-800, 800)
        ; float y = Utility.RandomFloat(-800, 800)
        ; float z = Utility.RandomFloat(600, 1000)
        ; PlacementMarker.MoveTo(player, afXOffset = x, afYOffset = y, afZOffset = z)
        ; cat.MoveTo(PlacementMarker)
        ; cat.MoveTo(PlacementMarker)

        ; Actor dog = SpawnMarker.PlaceAtMe(dogForm) as Actor
        ; dog.SetActorValue("Health", 10000)
        ; x = Utility.RandomFloat(-800, 800)
        ; y = Utility.RandomFloat(-800, 800)
        ; z = Utility.RandomFloat(600, 1000)
        ; PlacementMarker.MoveTo(player, afXOffset = x, afYOffset = y, afZOffset = z)
        ; dog.MoveTo(PlacementMarker)
        ; dog.MoveTo(PlacementMarker)

        i += 1
    endWhile
endEvent
