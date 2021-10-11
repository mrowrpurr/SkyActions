scriptName SkyActions_LoadGameHandler extends ReferenceAlias  
{Informs SkyActions when the player has loaded the game}

event OnPlayerLoadGame()
    (GetOwningQuest() as SkyActions).PlayerLoadGame()
endEvent
