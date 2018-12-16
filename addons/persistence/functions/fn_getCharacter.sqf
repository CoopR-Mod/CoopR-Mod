#include "script_component.hpp"

params ["_playerUid", "_slot"];

private _characterSlots = _playerUid call coopr_fnc_getCharacterSlots;
_characterSlots select _slot;


