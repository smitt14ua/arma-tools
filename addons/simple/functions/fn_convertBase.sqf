private _objects = _this;

if !(_objects isEqualType []) exitWith {};

private _buffer = "";

	{
		private _model = (getModelInfo _x) # 1;
		private _position = getPosWorld _x;
		private _vectorDir = vectorDir _x;
		private _vectorUp = vectorUp _x;

		_buffer = [
			_buffer, "// ", str _x, " / ", typeOf _x, endl,
			"_simple = createSimpleObject [", str _model, ", ", _position, ", true];", endl, 
			"_simple setVectorDirAndUp [", _vectorDir, ", ", _vectorUp, "];", endl
		] joinString "";
		delete3DENEntities [_x];
	} forEach _objects;

if (count _objects > 0) then {
	titleText [
		format [(localize "STR_st_simple_countOfConvertedObjects_f"), count _objects],
		"PLAIN",
		0.2
	];
} else {
	titleText [
		localize "STR_st_simple_noConvertedObjects",
		"PLAIN",
		0.2
	];
};

private _history = uiNamespace getVariable ["st_simple_bufferAll", ""];

uiNamespace setVariable ["st_simple_bufferAll", _history + _buffer];
uiNamespace setVariable ["st_simple_buffer", _buffer];

copyToClipboard _buffer;