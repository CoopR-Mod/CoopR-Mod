#include "script_component.hpp"

params ["_control", "_selectedIndex"];

private _newCharacterDisplay = findDisplay 1103;
private _picture = _newCharacterDisplay displayCtrl 3200;

private _roleName = _control lbText _selectedIndex;
private _rolesHash = _control getVariable ["_rolesHash", objNull];
private _roleId = [_rolesHash, _roleName] call CBA_fnc_hashGet;
private _roleImage = [_roleId] call coopr_fnc_getImageForRole;

private _pathToImage = format ["\x\coopr\addons\lobby\data\images\%1", _roleImage];

_picture ctrlSetText _pathToImage;