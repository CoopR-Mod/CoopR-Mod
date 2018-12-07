#include "script_component.hpp"

params [["_sideLobby", objNull],
        ["_logic", objNull]];

if (_sideLobby isEqualTo objNull) exitWith { ERROR("There was no side set for lobby module") };
if (_logic isEqualTo objNull) exitWith { ERROR("Module is not defined") };

if (_sideLobby isEqualTo "West") then {
    COOPR_LOBBY_WEST = _logic;
    SLOG("Lobby West initialized");
} else {
    COOPR_LOBBY_EAST = _logic;
    SLOG("Lobby East initialized");
};

