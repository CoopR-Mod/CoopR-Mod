{_x addEventHandler ["killed", {call X11_fnc_onAiKilled;}];} forEach allUnits;

systemChat "event initialized";
