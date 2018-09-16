params ["_playerId", "_playerName", "_classType", "_reputation", "_money"];

private _newPlayerHash = [["playerId", _playerId],
                          ["playerName", _playerName],
                          ["class", _classType],
                          ["reputation", _reputation],
                          ["money", _money]];

_newPlayerHash call CBA_fnc_hashCreate;
