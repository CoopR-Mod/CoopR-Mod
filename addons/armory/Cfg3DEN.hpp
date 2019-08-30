#include "script_component.hpp"

class Combo;

class Cfg3DEN {
    class Mission {
        class CoopR_Armory {
            displayName = "CoopR Armory";
            class AttributeCategories {
                class Logging {
                    displayName = "Logging";
                    class Attributes {
                        class LogLevel {
                            control = "combo";
                            property = "CoopRArmoryLogLevel";
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
            };
        };
    };
};


class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class CoopR_Addon_Attributes {
                    items[] += {"CoopR_Armory_Attributes"};
                };
                class CoopR_Armory_Attributes {
                    text = "CoopR Armory";
                    action = "edit3DENMissionAttributes 'CoopR_Armory';";
                };
            };
        };
    };
};
