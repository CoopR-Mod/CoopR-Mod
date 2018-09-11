params ["_player"];

private _getReputationPoints = {
    private _repPts = profileNamespace getVariable ["Reputation", 0];
    systemChat format ["*Deployed* : Reputation [%1]", _repPts];
};

_player addAction ["Show reputation", _getReputationPoints ,[],0.5];

systemChat "... player actions added";

