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
                            description = "The log level to use for this addon";
                            expression = QUOTE([ARR_2(_value, DEBUG_CTX)] call coopr_fnc_setLogLevel);
                            defaultValue = 0;
                            typeName = "NUMBER";
                            class Values {
                                class None {
                                    name = "None";
                                    value = 0;
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
                            control = "edit";
                            property = "CoopRRPGMaxPerks";
                            displayName = "Maximum Perks per Character";
                            description = "The maximum of mounts of perks allowed to select on character creation";
                            expression = "missionNamespace setVariable ['coopr_rpg_max_perks', _value]";
                            defaultValue = 3;
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
