private _control = _this#0;
private _display = ctrlParent _control;
if (_display isEqualTo displayNull) exitWith {}; //How the fuck are you even calling that function then?

private ["_modifierX", "_modifierY"];
private _screenWidth = getResolution#0;
private _screenHeight = getResolution#1;

{
    if ((ctrlParentControlsGroup _x) isEqualTo controlNull) then {
        _modifierX = safeZoneX;
        _modifierY = safeZoneY;
    } else {
        _modifierX = 0;
        _modifierY = 0;
    };
	(ctrlPosition _x) params ["_xPos", "_yPos", "_wPos", "_hPos"];
    _xPos = ((((_xPos * _screenWidth) / 1920) * safeZoneW) / _screenWidth + _modifierX);
    _yPos = ((((_yPos * _screenHeight) / 1080) * safeZoneH) / _screenHeight + _modifierY);
    _wPos = ((((_wPos * _screenWidth) / 1920) * safeZoneW) / _screenWidth);
    _hPos = ((((_hPos * _screenHeight) / 1080) * safeZoneH) / _screenHeight);
	_x ctrlSetPosition [_xPos, _yPos, _wPos, _hPos];
	_x ctrlCommit 0;
} forEach (allControls _display);