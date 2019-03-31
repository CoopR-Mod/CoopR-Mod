#include "script_component.hpp"

TSTART;

TEST("should serialize ellipse marker");
private _randomID = "testMarker_" + (str random 100);
private _hqPos = [9296.2, 8597.25, 0];
private _testMarker = createMarker [_randomID , _hqPos];
_testMarker setMarkerSize [100,100];
_testMarker setMarkerColor "ColorRed";
_testMarker setMarkerShape "ELLIPSE";

private _actual = [_testMarker, true] call coopr_fnc_serializeMarker;

TEXPECT(_randomID, _actual select 0);
TEXPECT(_hqPos, _actual select 1);

TEST("should deserialize ellipse marker");
_newMarker = [_actual] call coopr_fnc_deserializeMarker;

TEXPECT(_hqPos, markerPos _newMarker);
TEXPECT("circle", markerType _newMarker);
TEXPECT("ELLIPSE", markerShape _newMarker);

TEST("should serialize icon marker");
private _randomID = "testMarker_" + (str random 100);
private _hqPos = [9296.2, 8597.25, 0];
private _testMarker = createMarker [_randomID , _hqPos];
_testMarker setMarkerSize [1,1];
_testMarker setMarkerColor "ColorRed";
_testMarker setMarkerShape "ICON";
_testMarker setMarkerType "o_inf";

private _actual = [_testMarker, true] call coopr_fnc_serializeMarker;

TEXPECT(_randomID, _actual select 0);
TEXPECT(_hqPos, _actual select 1);

TEST("should deserialize icon marker");
_newMarker = [_actual] call coopr_fnc_deserializeMarker;

TEXPECT(_hqPos, markerPos _newMarker);
TEXPECT("o_inf", markerType _newMarker);
TEXPECT("ICON", markerShape _newMarker);

TEND;
