#include "script_component.hpp"

params [["_character", objNull],
        ["_picture", objNull]];

private _pathToImage = "";
private _basePath = "\x\coopr\addons\lobby\data\images\%1";

if (_character isEqualTo objNull) then {
   DEBUG("no character was chosen - using fallback image");
    private _imageForRole =  COOPR_ROLE_NONE call coopr_fnc_getImageForRole;
    _pathToImage = format [_basePath, _imageForRole];
} else {
    private _characterRole = [_character, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
    if (_characterRole isEqualTo COOPR_ROLE_NONE) then { ERROR("character has no role defined") };
    private _imageForRole =  _characterRole call coopr_fnc_getImageForRole;
    _pathToImage = format [_basePath, _imageForRole];
};

_picture ctrlSetText _pathToImage;

