scriptName SkyActionsUI_LoadGameHandler extends ReferenceAlias  
{Informs Sky Actions UI when the player has loaded the game}

event OnPlayerLoadGame()
    (GetOwningQuest() as SkyActionsUI).PlayerLoadGame()
endEvent