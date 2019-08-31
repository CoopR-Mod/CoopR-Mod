#include "script_component.hpp"

class Combo;
class ctrlMenuStrip;

class Cfg3DEN {
    class Mission {
        class CoopR_Integration {
            displayName = "CoopR Integration";
            class AttributeCategories {
                class Logging {
                    displayName = "Logging";
                    class Attributes {
                        class LogLevel {
                            control = "combo";
                            property = "CoopRIntegrationLogLevel";
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
                class Integration {
                    displayName = "Integration";
                    class Attributes {
                        class ACE3 {
                            control = "checkbox";
                            property = "CoopRIntegrateACE3";
                            displayName = "ACE3";
                            tooltip = "Will enable CoopR ACE3 features";
                            expression = "missionNamespace setVariable ['coopr_integration_ace', _value]";
                            defaultValue = false;
                            typeName = "BOOL";
                        };
                        class ALiVE {
                            control = "checkbox";
                            property = "CoopRIntegrateALiVE";
                            displayName = "ALiVE";
                            tooltip = "Will enable CoopR ALiVE features";
                            expression = "missionNamespace setVariable ['coopr_integration_alive', _value]";
                            defaultValue = false;
                            typeName = "BOOL";
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
                    items[] += {"CoopR_Integration_Attributes"};
                };
                class CoopR_Integration_Attributes {
                    text = "CoopR Integration";
                    action = "edit3DENMissionAttributes 'CoopR_Integration';";
                };
            };
        };
    };
};
