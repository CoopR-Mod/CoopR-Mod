#define GLOB(var) (missionNamespace getVariable var)
#define SET_CTRL_PARAMS(ctrl, paramArray) ctrl setVariable ["_params", paramArray]
#define GET_CTRL_PARAMS(ctrl, paramArray) private _params = ctrl getVariable ["_params", []]; _params params paramArray
