#include "script_component.hpp"

params [["_allowSync", true]];

if(_allowSync) then {
    ALLOW_SYNC = _allowSync;
    INFO("syncing activated");
}else{
    ALLOW_SYNC = _allowSync;
    INFO("syncing deactivated");
};

publicVariable "ALLOW_SYNC";
