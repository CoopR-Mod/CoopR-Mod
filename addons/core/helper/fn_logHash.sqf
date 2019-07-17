#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * logs the hash
 *
 * Arguments:
 * 0: _message <STRING> - title message
 * 0: _hash <CBA_HASH> - hash to log
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_message", ""],
        ["_hash", []]];

if (_hash isEqualTo []) exitWith { ERROR("_hash was not defined") };

DEBUG(_message);

_logPair = {
    DEBUG3("%1 = %2", _key, _value);
};

[_hash, _logPair] call CBA_fnc_hashEachPair;
