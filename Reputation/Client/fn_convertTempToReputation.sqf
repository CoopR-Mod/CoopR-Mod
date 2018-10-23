#include "..\constants.hpp"

params [
    ["_multiplier", 0]
];

_tempReputation = player getVariable [KEY_TMP_REPUTATION, 0] ;

if(_tempReputation != 0) then {
    _tempReputation = ceil (_tempReputation * _multiplier);
    _tempReputation call X11_fnc_updateReputation;
    player setVariable [KEY_TMP_REPUTATION, 0];
};

