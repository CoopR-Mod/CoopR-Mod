class CfgNotifications
{
    class Default
    {
        title = ""; // Title displayed as text on black background. Filled by arguments.
        iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };
    class ReputationGained
    {
        title = "Reputation gained";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        description = "+ %1 Rep Points from %2";
        priority = 7;
        duration =  5;
    };
    class ReputationLost
    {
        title = "Reputation lost";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
        description = "%1 Rep Points from %2";
        priority = 7;
        duration =  5;
    };
    class ShowReputation
    {
        title = "Current reputation";
        iconPicture = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        description = " %1 Rep Points and %2 Temp Rep Points";
        priority = 7;
        duration =  5;
    };

};