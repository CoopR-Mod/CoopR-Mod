class Cfg3DEN {
    class Mission {
        class CoopR_RPG {
            displayName = "CoopR RPG Attributes";
            //display = "Display3DENEditAttributesPreview"; // Optional - display for attributes window. Must have the same structure and IDCs as the default Display3DENEditAttributes
            class AttributeCategories {
                class Logging {
                    class Attributes {
                        class LogLevel {
                              displayName = "Log Level";
                              description = "The log level to use for this addon";
                              typeName = "NUMBER";
                              class Values {
                                  class opt_1 {name = "None"; value = 0;};
                                  class opt_2 {name = "Info"; value = 1; default = 1;};
                                  class opt_3 {name = "Debug"; value = 2;};
                              };
                        };
                    };
                };
            };
        };
    };
};
