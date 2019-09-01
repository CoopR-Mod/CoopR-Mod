#include "script_component.hpp"

class Combo;
class ctrlMenuStrip;

class Cfg3DEN {
    class Mission {
        class CoopR_Persistence {
            displayName = "CoopR Persistence";
            class AttributeCategories {
                class Logging {
                    displayName = "Logging";
                    class Attributes {
                        class LogLevel {
                            control = "combo";
                            property = "CoopRPersistenceLogLevel";
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
                class Persistence {
                    displayName = "Logging";
                    class Attributes {
                      class PersistenceLocation {
                          control = "combo";
                          displayName = "Persistence Location";
                          property = "CoopRPersistenceLocation";
                          tooltip = "Configure the persistence location either to local, official CoopR connection or a customized. If a connection to 'Official' or 'Custom' fails this will fallback to 'Local'. Therefore be sure to have the local persistence always ready to use";
                          expression = "missionNamespace setVariable ['coopr_persistence_location', _value]";
                          defaultValue = 0;
                          typeName = "NUMBER";
                          class Values {
                              class local {name = "Local"; value = 0; default = 1;};
                              //class official {name = "Official"; value = 1; default = 1;};
                              //class custom {name = "Custom"; value = 2;};
                          }
                      };
                     //class CustomLocation {
                     //    displayName = "Custom Persistence Location";
                     //    tooltip = "If 'Persistence Location' is set to 'Custom' then define the CoopR HQ here";
                     //    typeName = "STRING";
                     //}
                      class ServerId {
                          control = "editshort";
                          displayName = "CoopR Server ID";
                          property = "CoopRPersistenceServerId";
                          tooltip = "The identifier for this Coopr Server instance";
                          expression = "missionNamespace setVariable ['coopr_persistence_serverid', _value]";
                          defaultValue = 0;
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
                    items[] += {"CoopR_Persistence_Attributes"};
                };
                class CoopR_Persistence_Attributes {
                    text = "CoopR Persistence";
                    action = "edit3DENMissionAttributes 'CoopR_Persistence';";
                };
            };
        };
    };
};
