#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * picks the strength reports for every entry and accumulates it into an array
 *
 * Arguments:
 * 0: _entries <ARRAY>: all entries to parse
 *
 * Return Value:
 * _strengths <ARRAY>: all strengths in an array
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_entries", []]];

if ((count _entries) isEqualTo 0) exitWith { ERROR("_entries was undefined") };
private _strengths = [];
{ _strengths pushBack [_x, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet } forEach _entries;
_strength; // return
