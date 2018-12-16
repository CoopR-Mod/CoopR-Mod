#include "script_component.hpp"

params [["_logic", objNull]];

private _items = (allVariables _logic) select { (_x find "item") == 0};
private _itemValues = [];

{ _itemValues pushBack (call compile (_logic getVariable [_x, objNull])); } forEach _items;

private _itemValuesForHash = [];

// reformat plain array to hash array where config name is key
{
    private _hashArray = [];
    private _valueArray = [];

    _hashArray pushBack (_x select 0);  // config name
    _valueArray pushBack (_x select 1); // reputation value
    _valueArray pushBack (_x select 2); // menu name
    _valueArray pushBack (_x select 3); // menu description

    _hashArray pushBack _valueArray;
    _itemValuesForHash pushBack _hashArray;

} forEach _itemValues;

COOPR_REP_ITEMS_WEST = _itemValuesForHash;
DEBUG("quartermaster items have been set");

true