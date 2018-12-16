#include "script_component.hpp"

params [["_allowSync", true]];

if(_allowSync) then {
    ALLOW_SYNC = _allowSync;
    SLOG("syncing activated");
}else{
    ALLOW_SYNC = _allowSync;
    SLOG("syncing deactivated");
};

publicVariable "ALLOW_SYNC";
