
#include "..\constants.hpp"

systemChat format ["||DEPLOYED|| Du hast %1 RPTS erhalten!", REP_PER_DOGTAG];
REP_PER_DOGTAG call X11_fnc_updateReputation;
