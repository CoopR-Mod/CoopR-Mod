#include "..\globals.hpp"
#include "constants.hpp"

params ["_entity"];

private _randomNum = random [0,10,5];

if(_randomNum == 5){

  private _randomIntelItem = selectRandom INTEL_ITEMS_WHITELIST;
  _entity addItem _randomIntelItem;
  [format ["unit has received an intel item: %1", typeOf _randomIntelItem], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;

};

