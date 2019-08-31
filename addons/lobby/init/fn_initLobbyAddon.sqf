#include "script_component.hpp"

params [["_logic", objNull]];

if (_logic isEqualTo objNull) exitWith { SETUPERROR("Lobby module not defined") };

COOPR_LOBBY = _logic;
publicVariable "COOPR_LOBBY";

COOPR_LOBBY_CAM = objNull;
COOPR_LOBBY_AGENT = objNull;
COOPR_LOBBY_PROP_STRETCHER = "Land_Stretcher_01_F" createVehicle (getPos COOPR_LOBBY);
COOPR_LOBBY_PROP_BODYBAG = "Land_Bodybag_01_black_F" createVehicle (getPos COOPR_LOBBY);

INFO("lobby initialized");

