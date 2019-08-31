#include "script_component.hpp"

class Combo;
class ctrlMenuStrip;

class Cfg3DEN {
    class Mission {
        class CoopR_RPG {
            displayName = "CoopR RPG";
            class AttributeCategories {
                class Logging {
                    displayName = "Logging";
                    class Attributes {
                        class LogLevel {
                            control = "combo";
                            property = "CoopRRPGLogLevel";
                            displayName = "Log Level";
                            tooltip = "The log level to use for this addon";
                            expression = QUOTE([ARR_2(_value, DEBUG_CTX)] call coopr_fnc_setLogLevel);
                            defaultValue = 0;
                            typeName = "NUMBER";
                            class Values {
                                class None {
                                    name = "None";
                                    value = 0;
                                    default = 1;
                                };
                                class Info {
                                    name = "Info";
                                    value = 1;
                                };
                                class Debug {
                                    name = "Debug";
                                    value = 2;
                                };
                            };
                        };
                    };
                };
                class Perks {
                    displayName = "Perks";
                    class Attributes {
                        class MaxPerks {
                            control = "editshort";
                            property = "CoopRRPGMaxPerks";
                            displayName = "Maximum perks per character";
                            tooltip = "The maximum  perks allowed to select on character creation";
                            expression = "missionNamespace setVariable ['coopr_rpg_max_perks', _value]";
                            defaultValue = "missionNamespace setVariable ['coopr_rpg_max_perks', 3]";
                            typeName = "NUMBER";
                        }
                    };
                };
                class Reputation {
                    displayName = "Reputation";
                    class Attributes {
                        class ReputationPerInfantry {
                            control = "editshort";
                            property = "CoopRRPGRepPerInf";
                            displayName = "Reputation per infantry";
                            tooltip = "The reputation gained per character on hostile infantry elimination (default = 10)";
                            expression = "missionNamespace setVariable ['coopr_rpg_rep_inf', _value]";
                            defaultValue = 10;
                            typeName = "NUMBER";
                        }
                        class WoundedRepReduction {
                            control = "editshort";
                            property = "CoopRRPGWIARepReduction";
                            displayName = "Reputation reduction if WIA";
                            tooltip = "The reduction modifier if a character is wounded in a mission (i.e. '0.2' means 20% of reputation gained)";
                            expression = "missionNamespace setVariable ['coopr_rpg_wia_rep_reduction', _value]";
                            defaultValue = 0.2;
                            typeName = "NUMBER";
                        }
                    };
                };
            };
        };
    };
};


class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class CoopR_Addon_Attributes {
                    items[] += {"CoopR_RPG_Attributes"};
                };
                class CoopR_RPG_Attributes {
                    text = "CoopR RPG";
                    action = "edit3DENMissionAttributes 'CoopR_RPG';";
                };
            };
        };
    };
};
