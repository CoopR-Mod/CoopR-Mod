#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * This function will help checking if there is an undefined variable in your
 * function call and make use of the ERROR macro to report you which one
 *
 * Arguments:
 * 0: _requiredArguments <ARRAY> - whatever is inside _this magic variable when 
 * called from inside your function.
 *
 * Return Value:
 * true/false - <boolean>
 *
 * Example:
 * [_this] call coopr_fnc_checkUndefinedArguments;
 * if you have undefined arguments, then the function will return true 
 * and display the error message with the undefined argument index position.
 *
 * Public: No
 *
 * Scope: Global
 */

params["_magicVariable","_requiredArguments"];

private _argumentPosition = 0;

for "_x" from 0 to (_requiredArguments - 1) do {
	private _argument = _magicVariable select _x;
	_argumentPosition = _argumentPosition +1;

	if (isNil "_x") exitWith{
		_argumentPosition = format["argument position %1", _argumentPosition];
		ERROR2("Required argument undefined, %1", _argumentPosition);
		true;
	};
};

false;
