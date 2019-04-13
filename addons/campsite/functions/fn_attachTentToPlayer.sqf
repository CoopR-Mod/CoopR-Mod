#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Check the unit's backpack and attach the folded tent to a position that 
 * looks good with all cases. 
 * 
 *
 * Arguments:
 * 0: _unit      - <OBJECT> The unit taking the folded tent item.
 * 1: _backpack  - <STRING> The unit's backpapck classname.
 *
 * Return Value:
 * None
 *
 * Example:
 * trivial
 *
 * Public: No
 *
 * Scope: Client
 */

params ["_unit", "_backpack"];

private _createAndAttachTent = {
	params["_unit", "_attachPoint", "_vector"];

	private _newTent = "coopr_item_foldedTent" createVehicle [0,0,0];
	_unit disableCollisionWith _newTent;
	_newTent attachTo [_unit,_attachPoint, "pelvis"];
	_newTent setVectorDirAndUp _vector;
};

switch _backpack do{
	case "B_Carryall_ocamo": {
		_attachPoint   = [-0.155,-0.25,0.967];
		_vector= [[0.431,0.851,-0.301],[0.136,0.269,0.953]];
		[_unit, _attachPoint, _vector] call _createAndAttachTent;
	 };
	 default {
		_attachPoint   = [-0.155,-0.25,0.967];
		_vector= [[0.431,0.851,-0.301],[0.136,0.269,0.953]];
		[_unit, _attachPoint, _vector] call _createAndAttachTent;
	};
};




