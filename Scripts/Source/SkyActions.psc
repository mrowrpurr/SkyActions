Scriptname SkyActions extends Quest  
{Primary script for managing SkyActions}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Installation and Load Game Handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Mod Installation
event OnInit()
    CurrentlyInstalledModVersion = GetCurrentVersion()
    WaitUntilReady()
endEvent

; Save Game Loaded
event PlayerLoadGame()
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Versioning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

float property CurrentlyInstalledModVersion auto

float function GetCurrentVersion() global
    return 1.0
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Get Instance of Sky Actions script
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SkyActions function GetInstance() global
    SkyActions api = Game.GetFormFromFile(0x801, "SkyActions.esp") as SkyActions
    api.WaitUntilReady()
    return api
endFunction

bool _ready = false

function WaitUntilReady()
    if _ready
        return
    else
        _ready = true
    endIf

    ; Ensure that Save Game and File System data are prepared
    SaveGameData   ; Setup Save Game Data
    FileSystemData ; Setup File System Data
    
    InitializeActionArrays()
    InitializeAvailableActionArrayRegistrationSlots()
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Action Registration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property MAX_SKY_ACTIONS_COUNT = 2560 autoReadonly

SkyAction[] _skyActionsArray0
SkyAction[] _skyActionsArray1
SkyAction[] _skyActionsArray2
SkyAction[] _skyActionsArray3
SkyAction[] _skyActionsArray4
SkyAction[] _skyActionsArray5
SkyAction[] _skyActionsArray6
SkyAction[] _skyActionsArray7
SkyAction[] _skyActionsArray8
SkyAction[] _skyActionsArray9
SkyAction[] _skyActionsArray10
SkyAction[] _skyActionsArray11
SkyAction[] _skyActionsArray12
SkyAction[] _skyActionsArray13
SkyAction[] _skyActionsArray14
SkyAction[] _skyActionsArray15
SkyAction[] _skyActionsArray16
SkyAction[] _skyActionsArray17
SkyAction[] _skyActionsArray18
SkyAction[] _skyActionsArray19

function RegisterAction(string actionName, SkyAction actionScript) global
    SkyActions api = SkyActions.GetInstance()
    int newAction = JMap.object()
    JMap.setObj(api.ActionsByNameMap, actionName, newAction)
    JMap.setStr(newAction, "name", actionName)
    JMap.setInt(newAction, "actionScriptArraySlotNumber", api.StoreActionScript(actionScript))
    JMap.setInt(newAction, "ready", 1)
endFunction

SkyAction function GetSkyAction(string actionName) global
    SkyActions api = SkyActions.GetInstance()
    int actionMap = JMap.getObj(api.ActionsByNameMap, actionName)
    int slot = JMap.getInt(actionMap, "actionScriptArraySlotNumber")
    return api.GetActionScript(slot)
endFunction

string[] function GetAllActionNames()
    return JMap.allKeysPArray(ActionsByNameMap)
endFunction

function InitializeActionArrays()
    _skyActionsArray0  = new SkyAction[128]
    _skyActionsArray1  = new SkyAction[128]
    _skyActionsArray2  = new SkyAction[128]
    _skyActionsArray3  = new SkyAction[128]
    _skyActionsArray4  = new SkyAction[128]
    _skyActionsArray5  = new SkyAction[128]
    _skyActionsArray6  = new SkyAction[128]
    _skyActionsArray7  = new SkyAction[128]
    _skyActionsArray8  = new SkyAction[128]
    _skyActionsArray9  = new SkyAction[128]
    _skyActionsArray10 = new SkyAction[128]
    _skyActionsArray11 = new SkyAction[128]
    _skyActionsArray12 = new SkyAction[128]
    _skyActionsArray13 = new SkyAction[128]
    _skyActionsArray14 = new SkyAction[128]
    _skyActionsArray15 = new SkyAction[128]
    _skyActionsArray16 = new SkyAction[128]
    _skyActionsArray17 = new SkyAction[128]
    _skyActionsArray18 = new SkyAction[128]
    _skyActionsArray19 = new SkyAction[128]
endFunction

function InitializeAvailableActionArrayRegistrationSlots()
    int slots = JArray.object()
    JDB.solveObjSetter(JDB_PATH_AVAILABLESLOTS, slots, createMissingKeys = true)
    int i = 0
    while i < MAX_SKY_ACTIONS_COUNT
        JArray.addInt(slots, i)
        i += 1
    endWhile
endFunction

int property AvailableActionScriptRegistrationSlots
    int function get()
        return JDB.solveObj(JDB_PATH_AVAILABLESLOTS)
    endFunction
endProperty

int function StoreActionScript(SkyAction actionScript)
    int slot = GetNextAvailableActionScriptRegistrationSlot()

    int arrayNumber = slot / 128
    int arrayIndex = slot % 128

    if arrayNumber == 0
        _skyActionsArray0[arrayIndex] = actionScript
    elseIf arrayNumber == 1
        _skyActionsArray1[arrayIndex] = actionScript
    elseIf arrayNumber == 2
        _skyActionsArray2[arrayIndex] = actionScript
    elseIf arrayNumber == 3
        _skyActionsArray3[arrayIndex] = actionScript
    elseIf arrayNumber == 4
        _skyActionsArray4[arrayIndex] = actionScript
    elseIf arrayNumber == 5
        _skyActionsArray5[arrayIndex] = actionScript
    elseIf arrayNumber == 6
        _skyActionsArray6[arrayIndex] = actionScript
    elseIf arrayNumber == 7
        _skyActionsArray7[arrayIndex] = actionScript
    elseIf arrayNumber == 8
        _skyActionsArray8[arrayIndex] = actionScript
    elseIf arrayNumber == 9
        _skyActionsArray9[arrayIndex] = actionScript
    elseIf arrayNumber == 10
        _skyActionsArray10[arrayIndex] = actionScript
    elseIf arrayNumber == 11
        _skyActionsArray11[arrayIndex] = actionScript
    elseIf arrayNumber == 12
        _skyActionsArray12[arrayIndex] = actionScript
    elseIf arrayNumber == 13
        _skyActionsArray13[arrayIndex] = actionScript
    elseIf arrayNumber == 14
        _skyActionsArray14[arrayIndex] = actionScript
    elseIf arrayNumber == 15
        _skyActionsArray15[arrayIndex] = actionScript
    elseIf arrayNumber == 16
        _skyActionsArray16[arrayIndex] = actionScript
    elseIf arrayNumber == 17
        _skyActionsArray17[arrayIndex] = actionScript
    elseIf arrayNumber == 18
        _skyActionsArray18[arrayIndex] = actionScript
    elseIf arrayNumber == 19
        _skyActionsArray19[arrayIndex] = actionScript
    endIf

    return slot
endFunction

SkyAction function GetActionScript(int slot)
    int arrayNumber = slot / 128
    int arrayIndex = slot % 128

    if arrayNumber == 0
        return _skyActionsArray0[arrayIndex]
    elseIf arrayNumber == 1
        return _skyActionsArray1[arrayIndex]
    elseIf arrayNumber == 2
        return _skyActionsArray2[arrayIndex]
    elseIf arrayNumber == 3
        return _skyActionsArray3[arrayIndex]
    elseIf arrayNumber == 4
        return _skyActionsArray4[arrayIndex]
    elseIf arrayNumber == 5
        return _skyActionsArray5[arrayIndex]
    elseIf arrayNumber == 6
        return _skyActionsArray6[arrayIndex]
    elseIf arrayNumber == 7
        return _skyActionsArray7[arrayIndex]
    elseIf arrayNumber == 8
        return _skyActionsArray8[arrayIndex]
    elseIf arrayNumber == 9
        return _skyActionsArray9[arrayIndex]
    elseIf arrayNumber == 10
        return _skyActionsArray10[arrayIndex]
    elseIf arrayNumber == 11
        return _skyActionsArray11[arrayIndex]
    elseIf arrayNumber == 12
        return _skyActionsArray12[arrayIndex]
    elseIf arrayNumber == 13
        return _skyActionsArray13[arrayIndex]
    elseIf arrayNumber == 14
        return _skyActionsArray14[arrayIndex]
    elseIf arrayNumber == 15
        return _skyActionsArray15[arrayIndex]
    elseIf arrayNumber == 16
        return _skyActionsArray16[arrayIndex]
    elseIf arrayNumber == 17
        return _skyActionsArray17[arrayIndex]
    elseIf arrayNumber == 18
        return _skyActionsArray18[arrayIndex]
    elseIf arrayNumber == 19
        return _skyActionsArray19[arrayIndex]
    endIf
endFunction

float _nextAvailableActionScriptRegistrationSlotLock

int function GetNextAvailableActionScriptRegistrationSlot(float lock = 0.0)
    if lock == 0
        lock = Utility.RandomFloat(0, 1000000.0)
    endIf

    while _nextAvailableActionScriptRegistrationSlotLock
        Utility.WaitMenuMode(0.1)
    endWhile

    _nextAvailableActionScriptRegistrationSlotLock = lock

    if _nextAvailableActionScriptRegistrationSlotLock == lock
        if _nextAvailableActionScriptRegistrationSlotLock == lock
            ; Get and return the slot
            if JArray.count(AvailableActionScriptRegistrationSlots) > 0
                int availableSlot = JArray.getInt(AvailableActionScriptRegistrationSlots, 0)
                JArray.eraseIndex(AvailableActionScriptRegistrationSlots, 0)
                _nextAvailableActionScriptRegistrationSlotLock = 0
                return availableSlot
            else
                Debug.Trace("There are no more available slots for Actions")
                return 0
            endIf
            ; 
        else
            return GetNextAvailableActionScriptRegistrationSlot(lock)
        endIf
    else
        return GetNextAvailableActionScriptRegistrationSlot(lock)
    endIf
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SkyActions Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

string JDB_PATH_SAVEGAMEDATA   = ".skyActions.save"
string JDB_PATH_FILESYSTEMDATA = ".skyActions.files"
string JDB_PATH_ACTIONSBYNAME  = ".skyActions.save.actionsByName"
string PATH_AVAILABLESLOTS     = "AvailableActionScriptRegistrationSlots"
string JDB_PATH_AVAILABLESLOTS = ".skyActions.save.AvailableActionScriptRegistrationSlots"

int property SaveGameData
    int function get()
        int data = JDB.solveObj(JDB_PATH_SAVEGAMEDATA)
        if ! data
            data = JMap.object()
            JDB.solveObjSetter(JDB_PATH_SAVEGAMEDATA, data, createMissingKeys = true)
            JMap.setObj(data, "actionsByName", JMap.object())
        endIf
        return data
    endFunction
endProperty

int property ActionsByNameMap
    int function get()
        return JDB.solveObj(JDB_PATH_ACTIONSBYNAME)
    endFunction
endProperty

int property FileSystemData
    int function get()
        int data = JDB.solveObj(JDB_PATH_FILESYSTEMDATA)
        if ! data
            data = JMap.object()
            JDB.solveObjSetter(JDB_PATH_FILESYSTEMDATA, data, createMissingKeys = true)
        endIf
        return data
    endFunction
endProperty
