params ["_thisTrigger", "_thisList"];

_renegades = thisList select {_x getVariable 'isRenegade'};
{_x setPos (getPos prison)} forEach _renegades;

