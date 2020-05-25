disableSerialization;
params ["_display"];

(findDisplay 6500) closeDisplay 2;

private _ctrlGroup = _display displayCtrl 2300;
private _ctrlTextarea = _display displayCtrl 1400;
private _ctrlSubmit = _display displayCtrl 1600;
private _ctrlError = _display displayCtrl 1001;

private _ctrlGroupPos = ctrlPosition _ctrlGroup;
_ctrlTextarea ctrlSetPosition [0, 0];
_ctrlTextarea ctrlSetPositionW (_ctrlGroupPos # 2);
_ctrlTextarea ctrlSetPositionH (_ctrlGroupPos # 3);
_ctrlTextarea setVariable ["minHeight", _ctrlGroupPos # 3];
_ctrlTextarea ctrlCommit 0;

_ctrlTextarea ctrlAddEventHandler ["KeyDown", {
	private _ctrl = _this # 0;
	private _textHeight = ctrlTextHeight _ctrl;
	_ctrl ctrlSetPositionH (_textHeight max (_ctrl getVariable ["minHeight", 0.1]));
	_ctrl ctrlCommit 0;
	false
}];

_ctrlTextarea ctrlAddEventHandler ["KeyUp", {
	private _ctrl = _this # 0;
	private _textHeight = ctrlTextHeight _ctrl;
	_ctrl ctrlSetPositionH (_textHeight max (_ctrl getVariable ["minHeight", 0.1]));
	_ctrl ctrlCommit 0;
	false
}];

_ctrlSubmit ctrlAddEventHandler ["ButtonClick", {
	_control = _this # 0;
	_display = ctrlParent _control;
	_ctrlError = _display displayCtrl 1001;
	_code = ctrlText 1400;
	_return = _code call st_simple_fnc_createFromCode;
	if (_return isEqualTo true) exitWith {
		closeDialog 1;
	};
	if (_return isEqualType "") exitWith {
		ctrlSetText [1001, _return];
		_ctrlError ctrlSetBackgroundColor [0, 0, 0, 0.8];
	};
	ctrlSetText [1001, localize "STR_st_simple_unknownError"];
	_ctrlError ctrlSetBackgroundColor [0, 0, 0, 0.8];
	false
}];