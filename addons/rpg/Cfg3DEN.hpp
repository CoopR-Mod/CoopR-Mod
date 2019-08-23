class Combo;
class ctrlMenuStrip;

class LogLevelCombo: Combo {
    class Items {
        class None {
            text = "None";
            data = 0;
        };
        class Info {
            text = "Info";
            data = 1;
        };
        class Debug {
            text = "Debug";
            data = 2;
        };
    };
};

class Cfg3DEN {
    class Mission {
        class CoopR_RPG {
            displayName = "CoopR RPG Attributes";
            class AttributeCategories {
                class Logging {
                    class Attributes {
                        class LogLevelCombo;
                        class LogLevel {
                              control = "LogLevelCombo";
                              property = "CoopRRPGLogLevel";
                              displayName = "Log Level";
                              description = "The log level to use for this addon";
                              expression = "_this setVariable [""coopr_%s_rpg"", _value];";
                              defaultValue = 0;
                              typeName = "NUMBER";
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
