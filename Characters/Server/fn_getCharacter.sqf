#include "..\constants.hpp"

params ["_playerUid", "_slot"];

private _characterSlots = _playerUid call X11_fnc_getCharacterSlots;
_characterSlots select _slot;


