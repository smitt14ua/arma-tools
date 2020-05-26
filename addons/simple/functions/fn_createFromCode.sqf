private _code = _this;

// Remove all spaces in code
_code = (_code splitString " ") joinString "";

if (_code isEqualTo "") exitWith {
	titleText [
		localize "STR_st_simple_noCreatedObjects",
		"PLAIN",
		0.2
	];
	true
};

private _lines = _code splitString toString [13,10];
private _count = count _lines;
private _objects = [];
private _error = "";

for "_i" from 0 to (_count - 2) do {
	if !(_error isEqualTo "") exitWith {};
	_comment = _lines # _i;
	_prefix = _comment select [0, 2];
	_text = _comment select [2];
	if (_prefix isEqualTo "//") then {
		// Getting special comment with classname
		_lineArr = _text splitString "/";
		if (count _lineArr isEqualTo 2) then {
			_classname = _lineArr # 1;
			_i = _i + 1;
			_line = _lines # _i;
			_lineArr = _line splitString "[],";
			if (count _lineArr isEqualTo 7) then {
				// Getting position
				_posX = parseNumber (_lineArr # 2);
				_posY = parseNumber (_lineArr # 3);
				_posZ = parseNumber (_lineArr # 4);
				_pos = [_posX, _posY, _posZ];
				_i = _i + 1;
				_line = _lines # _i;
				_lineArr = _line splitString "[],";
				if (count _lineArr isEqualTo 8) then {
					// Getting vectors (dir and up)
					_vecDirX = parseNumber (_lineArr # 1);
					_vecDirY = parseNumber (_lineArr # 2);
					_vecDirZ = parseNumber (_lineArr # 3);
					_vecUpX = parseNumber (_lineArr # 4);
					_vecUpY = parseNumber (_lineArr # 5);
					_vecUpZ = parseNumber (_lineArr # 6);
					_vecDir = [_vecDirX, _vecDirY, _vecDirZ];
					_vecUp = [_vecUpX, _vecUpY, _vecUpZ];
					_objects pushBack [_classname, _pos, [_vecDir, _vecUp]];
				} else {
					_error = format [(localize "STR_st_simple_invalidCodeAt_f"), _comment];
				};
			} else {
				_error = format [(localize "STR_st_simple_invalidCodeAt_f"), _comment];
			};
		};
	};
};

// Display error message
if !(_error isEqualTo "") exitWith {_error};

// Creating special layer if it not exist
_layerID = uiNamespace getVariable ["st_simple_layerID", -1];
if (-1 isEqualTo (get3DENEntity _layerID)) then {
	_layerID = -1 add3DENLayer localize "STR_st_simple_layerName";
	uiNamespace setVariable ["st_simple_layerID", _layerID];
};

// Creating objects as Editor Entity
collect3DENHistory {
	{
		_classname = _x # 0;
		_pos = _x # 1;
		_vecDirUp = _x # 2;
		_entity = create3DENEntity ["Object", _classname, _pos, true];
		_entity set3DENLayer _layerID;
		_entity setPosWorld _pos;
		_entity setVectorDirAndUp _vecDirUp;
		_ePos = getPos _entity;
		_yaw = getDir _entity;
		// The bank returned by this command is not fully accurate, 
		// it can be off by up to 5% or so (depending on pitch) due to an unknown bug.
		_pitchBank = _entity call BIS_fnc_getPitchBank;
		_rotation = _pitchBank;
		_rotation pushBack _yaw;
		_entity set3DENAttribute ["position", _ePos];
		_entity set3DENAttribute ["rotation", _rotation];
	} forEach _objects;
};

private _created = count _objects;

if (_created > 0) exitWith {
	titleText [
		format [(localize "STR_st_simple_countOfCreatedObjects_f"), _created],
		"PLAIN",
		0.2
	];
	true
};

titleText [
	localize "STR_st_simple_noCreatedObjects",
	"PLAIN",
	0.2
];
true
