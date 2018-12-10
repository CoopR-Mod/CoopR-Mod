#include "script_component.hpp"

LSTART("QUARTERMASTER ITEMS");
FLOG("reputation item template: %1", COOPR_REP_ITEM_TEMPLATE);

if (COOPR_REP_ITEM_TEMPLATE isEqualTo "vanilla") then {
     COOPR_REP_ITEMS_WEST =  [["arifle_MXC_F", 15],
                             ["arifle_MXC_F", 30]];
};

if (COOPR_REP_ITEM_TEMPLATE isEqualTo "coopr_server_1") then {
     COOPR_REP_ITEMS_WEST =  [["BWA3_G36A1_AG40", 15],
                              ["BWA3_G36A2", 25],
                              ["BWA3_G36KA2", 35],
                              ["BWA3_G36KA3_tan", 50],
                              ["arifle_SPAR_01_blk_F", 65],
                              ["arifle_SPAR_02_snd_F", 70],
                              ["arifle_SPAR_03_khk_F", 85]];
};

LEND("QUARTERMASTER ITEMS");
