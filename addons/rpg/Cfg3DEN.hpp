class Combo;
class ctrlMenuStrip;

class Cfg3DEN {
    class Mission {
        class CoopR_RPG {
            displayName = "CoopR RPG Attributes";
            class AttributeCategories {
                class Logging {
                    class Attributes {
                        class LogLevel {
                            control = "combo";
                            property = "CoopRRPGLogLevel";
                            displayName = "Log Level";
                            description = "The log level to use for this addon";
                            expression = "_this setVariable [""coopr_%s_rpg"", _value];";
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
            };
        };
    };
};


class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Attributes {
                    items[] += {"CoopR_RPG_Attributes"};
                };
                class CoopR_RPG_Attributes {
                    text = "CoopR RPG Settings";
                    action = "edit3DENMissionAttributes 'CoopR_RPG';";
                };
            };
        };
    };
};
