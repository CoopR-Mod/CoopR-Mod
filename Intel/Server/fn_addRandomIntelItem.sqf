
#include "..\constants.hpp"

params ["_entity"];

private _randomNum = floor (random [0,10,5]);

if(_randomNum isEqualTo 5) exitWith {
  private _randomIntelItem = selectRandom INTEL_ITEMS_WHITELIST;
  private _hasAdded = [_entity, _randomIntelItem] call CBA_fnc_addItem;

  if(not _hasAdded) exitWith{
      [format ["could not add item intel item: %1", _randomIntelItem], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
  };

  [format ["unit has received an intel item: %1", _randomIntelItem], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
};

