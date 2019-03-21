#include "script_component.hpp"

TSTART;

TEST("should serialize marker");
private _testMarker = createMarker ["testMarker", [250,250]];
private _actual = [_testMarker] call coopr_fnc_serializeMarker;

TEXPECT("testMarker", _actual select 0);
TEXPECT([250,250], _actual select 1);

TEST("should deserialize marker");
_newMarker = [_actual] call coopr_fnc_deserializeMarker;

TEXPECT([250,250], markerPos _newMarker);

TEND;
