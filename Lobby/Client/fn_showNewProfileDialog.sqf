
#include "..\constants.hpp"

params ["_slot"];

disableSerialization;

SLOG("initialising new profile dialog");

createDialog "X11_NewProfile_Dialog";
waitUntil {!isNull findDisplay 1103};

private _newProfileDisplay = findDisplay 1103;
private _nameTextEdit = _newProfileDisplay displayCtrl 3400;
private _specCombobox = _newProfileDisplay displayCtrl 3100;
private _createButton = _newProfileDisplay displayCtrl 3600;
private _picture = _newProfileDisplay displayCtrl 3200;

private _classesHash = [PROFILE_CLASSES, []] call CBA_fnc_hashCreate;
private _classNames = [_classesHash] call CBA_fnc_hashKeys;

_createButton setVariable ["_nameTextEdit", _nameTextEdit];
_createButton setVariable ["_specCombobox", _specCombobox];
_createButton setVariable ["_classesHash", _classesHash];
_createButton setVariable ["_slot", _slot];

// TODO: Escape press returns to Login
// _loginDisplay displayAddEventHandler ["KeyDown", "true"];

{_specCombobox lbAdd _x} forEach _classNames;

_createHandler = {
    DEBUG("executing new profile handler");
    private _ctrl = _this select 0;
    private _nameTextEdit = _ctrl getVariable ["_nameTextEdit", objNull];
    private _specCombobox = _ctrl getVariable ["_specCombobox", objNull];
    private _classesHash = _ctrl getVariable ["_classesHash", objNull];
    private _slot = _ctrl getVariable ["_slot", -1];

    private _uid = getPlayerUID player;
    private _name = ctrlText _nameTextEdit;
    private _index = lbCurSel _specCombobox;
    private _className = _specCombobox lbText _index;
    private _classId = [_classesHash, _className] call CBA_fnc_hashGet;
    private _loadOut = _classId call X11_fnc_getLoadoutForClass;

    FLOG("creating new profile for %1", _uid);
    FLOG("profile slot is %1", _slot);

    private _profile = [_uid, _name, _classId, 0, 500, false, 0] call X11_fnc_createPlayerProfile;
    [_profile, KEY_LOADOUT, _loadOut] call CBA_fnc_hashSet;

    [getPlayerUID player, _profile, _slot] remoteExec ["X11_fnc_saveProfile", SERVER];

    closeDialog 1;
    [] spawn X11_fnc_showLoginDialog;
};

_createButton ctrlAddEventHandler ["MouseButtonDown", _createHandler];
