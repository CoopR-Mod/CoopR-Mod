if (!isNil "keymaster") then { call X11_fnc_initKeymaster; };
if (!isNil "intelmaster") then { call X11_fnc_initIntelmaster; };
if (!isNil "repmaster") then { call X11_fnc_initReputationmaster; };
if (!isNil "vendor") then { call X11_fnc_initVendor; };
