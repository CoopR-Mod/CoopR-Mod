#include "script_component.hpp"

params [["_logic", objNull]];

if (_logic isEqualTo objNull) exitWith { SETUPERROR("Module is not defined") };

COOPR_LOBBY = _logic;
publicVariable "COOPR_LOBBY";

COOPR_LOBBY_CAM = objNull;
COOPR_LOBBY_AGENT = objNull;

INFO("lobby initialized");


