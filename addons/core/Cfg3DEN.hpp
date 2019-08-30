#include "script_component.hpp"

class Combo;
class CheckBoxState;
class ctrlMenuStrip;

class Cfg3DEN {
    class Mission {
        class CoopR_Core {
            displayName = "CoopR Core";
            class AttributeCategories {
                class Development {
                    displayName = "Development";
                    class Attributes {
                        class DevMode {
                            control = "checkboxstate";
                            property = "CoopRCoreDevMode";
                            displayName = "Development Mode";
                            tooltip = "When developer mode is active debug functions can be used to provide debug gameplay states";
                            expression = "missionNamespace setVariable ['coopr_core_dev_mode', _value]";
                            defaultValue = false;
                            typeName = "BOOL";
                        };
                    };
                };
                class Logging {
                    displayName = "Logging";
                    class Attributes {
                        class LogLevel {
                            control = "combo";
                            property = "CoopRCoreLogLevel";
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
                class Attributes {
                    items[] += {"CoopR_Addon_Attributes"};
                };
                class CoopR_Addon_Attributes {
                    text = "CoopR Addon Attributes";
                    items[] += {"CoopR_Core_Attributes"};
                };
                class CoopR_Core_Attributes {
                    text = "CoopR Core";
                    action = "edit3DENMissionAttributes 'CoopR_Core';";
                };
            };
        };
    };
};
