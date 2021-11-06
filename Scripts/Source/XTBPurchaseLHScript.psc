Scriptname XTBPurchaseLHScript extends ObjectReference  
{Foo and bar}

; The simple menu to show for the player after activating the property sign
Message property ConfirmationMenu auto

; The key to the player home
Key property XTBLHKey auto

; The item for gold
MiscObject property Gold001 auto

; This is a quick mesage which will show upon purchasing the home to inform the player about the key to the home
String TUTORIAL = "...."

; The message to show if the player does not have enough money
String FAIL = "........."

; The amount of gold you wish the home to cost
Int Cost = 5000

Bool HouseOwned

Actor property PlayerRef auto

function oNaCtIvAtE(ObjectReference akActionRef)
    if HouseOwned == false
        Int iButton = ConfirmationMenu.Show()

        if iButton == 0
            return 

        elseIf iButton == 1
            if PlayerRef.GetItemCount(Gold001) >= Cost
                PlayerRef.RemoveItem(Gold001, Cost)
                PlayerRef.AddItem(XTBLHKey)
                game.IncrementStat("Houses Owned", 1)
                HouseOwned = true
                debug.messagebox(TUTORIAL)

            else
                debug.messagebox(FAIL)

            endIf
            utility.WaitGameTime(12 as Float)
            self.disable(false)
        endIf

    else
        debug.notification("Lavenhall is no longer for sale!")
    endIf
endFunction