#include "script_component.hpp"

params ["_character", "_picture", "_slot"];

private _characterRole = [_character, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
if(_characterRole isEqualTo COOPR_ROLE_NONE) exitWith { ERROR("character has no role defined") };
private _imageForRole =  _characterRole call coopr_fnc_getImageForRole;
private _pathToImage = format ["\x\coopr\addons\lobby\data\images\%1", _imageForRole];
_picture ctrlSetText _pathToImage;

