#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Event handler if a character has been selected
 *
 * Arguments:
 * 0: _characterHash <NUMBER> - number of the slot
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_characterHash", []]];
if (_characterHash isEqualTo []) exitWith { ERROR("_characterHash was not defined") };

// prepare lobby agent and props
detach COOPR_LOBBY_AGENT;
COOPR_LOBBY_AGENT setUnitLoadout EMPTY_LOADOUT;
COOPR_LOBBY_AGENT switchMove "";
COOPR_LOBBY_AGENT setDir 0;
COOPR_LOBBY_AGENT hideObject false;
hideObject COOPR_LOBBY_PROP_STRETCHER;
hideObject COOPR_LOBBY_PROP_BODYBAG;

private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;

// hide the creation control if open
private _characterCreationCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_CREATION;
_characterCreationCtrl ctrlShow false;
_characterCreationCtrl ctrlEnable false;

// show the description control if open
private _characterDescriptionCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION;
_characterDescriptionCtrl ctrlShow true;
_characterDescriptionCtrl ctrlEnable true;

private _roleClass = [_characterHash, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
private _roleName = [_roleClass, "name"] call coopr_fnc_getRoleData;

private _reputation = [_characterHash, COOPR_KEY_REPUTATION] call CBA_fnc_hashGet;
private _tmpReputation = [_characterHash, COOPR_KEY_TMP_REPUTATION] call CBA_fnc_hashGet;
private _state = [_characterHash, COOPR_KEY_STATE] call CBA_fnc_hashGet;
private _name = [_characterHash, COOPR_KEY_NAME] call CBA_fnc_hashGet;

private _titleCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_TITLE;
private _textCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_TEXT;
private _deleteButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_DELETE_BUTTON;
private _playButton = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_PLAY_BUTTON;
private _roleCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_ROLE;
private _perksCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_PERKS;
private _traitsCtrl = _loginDialog displayCtrl GUI_ID_LOGIN_CHARACTER_DESCRIPTION_TRAITS;

_titleCtrl ctrlSetText _name;

//set role picture for selected character
private _roleIcon = [_roleClass, "icon"] call coopr_fnc_getRoleData;
_roleCtrl ctrlSetText _roleIcon;
_perksCtrl ctrlSetText _roleIcon; // TODO: change to perk icon
_traitsCtrl ctrlSetText _roleIcon; // TODO: change to trait icon

private _roleText = parseText (format ["<t>Role:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, _roleName]);
private _levelText = parseText (format ["<t>Level:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, 0]);
private _perksText = parseText (format ["<t>Perks:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, "No Perk"]);
private _traitsText = parseText (format ["<t>Traits:</t><t color='%1'> %2</t>", COOPR_MAIN_COLOR_HEX, "No Trait"]);

private _stateLabel = "None";
switch (_state) do {
    case COOPR_STATE_OK: {
       _stateLabel = parseText (format ["<t>State: </t><t color='%1'>OK</t>", COOPR_POSITIVE_COLOR_HEX]);
    };
    case COOPR_STATE_WIA: {
       _stateLabel = parseText (format ["<t>State: </t><t color='%1'>Wounded In Action</t>", COOPR_WARN_COLOR_HEX]);
    };
    case COOPR_STATE_KIA: {
       _stateLabel = parseText (format ["<t>State: </t><t color='%1'>Killed In Action</t>", COOPR_ERROR_COLOR_HEX]);
    };
    case COOPR_STATE_HOSTAGE: {
       _stateLabel = parseText (format ["<t>State: </t><t color='%1'>Taken As Hostage</t>", COOPR_WARN_COLOR_HEX]);
    };
};

private _reputationText = parseText (format ["<t>Reputation:</t><t color='%1'> %2</t>", COOPR_POSITIVE_COLOR_HEX, _reputation]);
private _tmpReputationText = parseText (format ["<t>Temp Reputation:</t><t color='%1'> %2</t>", COOPR_POSITIVE_COLOR_HEX, _tmpReputation]);

private _composedText = composeText [_roleText, lineBreak, _levelText, lineBreak, _perksText, lineBreak, _traitsText,
                                     lineBreak, lineBreak, _stateLabel, lineBreak, _reputationText, lineBreak, _tmpReputationText];

//set character text
_textCtrl ctrlSetStructuredText _composedText;

private _slot = [_characterHash, COOPR_KEY_SLOT] call CBA_fnc_hashGet;

_deleteButton ctrlRemoveAllEventHandlers "MouseButtonDown";
_deleteButton setVariable ["_params", [_slot]];
_deleteButton ctrlAddEventHandler ["MouseButtonDown", {
    params [["_ctrl", objNull]];
    private _params = _ctrl getVariable ["_params", []];
    _params params ["_slot"];
    [_ctrl, _slot] spawn {
        params ["_ctrl", "_slot"];
        private _warnText = "<t>Do you really want to <t underline='1'>DELETE</t> this character?</t>";
        private _isConfirmed = [_warnText, "Delete Character", "DELETE", "ABORT"] call BIS_fnc_guiMessage;

        if (_isConfirmed) then {
            [getPlayerUID player, _slot] remoteExec ["coopr_fnc_removeCharacter", EXEC_SERVER];
            closeDialog GUI_ID_LOGIN_DIALOG;
            // reset to default animation
            [] spawn { call coopr_fnc_playAnimationForRole ;};
        };
    };
}];

_playButton setVariable ["_params", [_characterHash]];
_playButton ctrlRemoveAllEventHandlers "MouseButtonDown";
_playButton ctrlAddEventHandler ["MouseButtonDown", {
    params [["_ctrl", objNull]];
    private _params = _ctrl getVariable ["_params", []];
    _params params ["_characterHash"];

    private _loginText = format ["<t size='3' color='%1'>Entering CoopR Session</t>", COOPR_MAIN_COLOR_HEX];
    // remove unload handler to prevent reinit of login dialog
    private _loginDialog = findDisplay GUI_ID_LOGIN_DIALOG;
    _loginDialog displayRemoveAllEventHandlers "Unload";
    closeDialog GUI_ID_LOGIN_DIALOG;

    cutText [_loginText, "BLACK OUT", 1, false, true];
    [_characterHash] spawn {
        params ["_characterHash"];
        sleep 3;

        [_characterHash] call coopr_fnc_login;

        // destroy login camera
        COOPR_LOBBY_CAM cameraEffect ["terminate","back"];
        camDestroy COOPR_LOBBY_CAM;
    };
}];

switch (_state) do {
    case COOPR_STATE_OK: {
        _playButton ctrlEnable true;
        _playButton ctrlSetText "Play";
        // set loadout on character preview
        private _loadout = [_characterHash, COOPR_KEY_LOADOUT] call CBA_fnc_hashGet;
        if (count _loadout isEqualTo 0) then {
            ERROR("character loadout could not be revoked after selection")
        } else {
            COOPR_LOBBY_AGENT setUnitLoadout _loadout;
            // reset default animation
            [] spawn { call coopr_fnc_playAnimationForRole; };
        };
    };
    case COOPR_STATE_WIA: {
        //[COOPR_LOBBY_AGENT, "PRONE_INJURED_U1", "NONE", _stretcher] call BIS_fnc_ambientAnim;
        COOPR_LOBBY_AGENT setUnitLoadout WOUNDED_LOADOUT;
        COOPR_LOBBY_AGENT switchMove "Acts_LyingWounded_loop3";
        COOPR_LOBBY_AGENT attachTo [COOPR_LOBBY_PROP_STRETCHER, [0, 0, 0.2]];
        COOPR_LOBBY_PROP_STRETCHER setDir 45;
        COOPR_LOBBY_PROP_STRETCHER hideObject false;
        _playButton ctrlRemoveAllEventHandlers "MouseButtonDown";
        _playButton ctrlSetText "WIA";
        _playButton ctrlEnable false;
    };
    case COOPR_STATE_KIA: {
        hideObject COOPR_LOBBY_AGENT;
        COOPR_LOBBY_PROP_BODYBAG setDir 45;
        COOPR_LOBBY_PROP_BODYBAG setPos [(getPos COOPR_LOBBY) select 0, ((getPos COOPR_LOBBY) select 1) - 1, 0];
        COOPR_LOBBY_PROP_BODYBAG hideObject false;
        _playButton ctrlRemoveAllEventHandlers "MouseButtonDown";
        _playButton ctrlSetText "KIA";
        _playButton ctrlEnable false;
    };
    case COOPR_STATE_HOSTAGE: {
        COOPR_LOBBY_AGENT switchMove "Acts_ExecutionVictim_Loop";
        COOPR_LOBBY_AGENT setPos (getPos COOPR_LOBBY);
        COOPR_LOBBY_AGENT setUnitLoadout HOSTAGE_LOADOUT;
        COOPR_LOBBY_AGENT setPos [(getPos COOPR_LOBBY_AGENT) select 0, ((getPos COOPR_LOBBY_AGENT) select 1) - 1, 0];
        _playButton ctrlSetText "DETAINED";
    };
};
