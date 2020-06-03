#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Базовая функция для перевода объектов в простые.
---------------------------------------------------------------------------- */

params ["_objects"];

private _code = "";
private _count = count _objects;

{
    private _modelPath = (getModelInfo _x) # 1;
    private _position = getPosWorld _x;
    private _vectorDir = vectorDir _x;
    private _vectorUp = vectorUp _x;

    _code = [
        _code,
        "// ", typeOf _x, endl,
        "_temp = createSimpleObject [", str _modelPath, ", ", _position, ", true];", endl, 
        "_temp setVectorDirAndUp [", _vectorDir, ", ", _vectorUp, "];", endl
    ] joinString "";

    if (!is3DEN) then {deleteVehicle _x};
} forEach _objects;

if (is3DEN) then {delete3DENEntities _objects};

if (_count > 0) exitWith {
    private _conversions = uiNamespace getVariable [QGVAR(conversions), ""];
    _conversions = _conversions + _code;
    uiNamespace setVariable [QGVAR(conversions), _conversions];
    uiNamespace setVariable [QGVAR(conversionLatest), _code];

    if (is3DEN) then {
        [format [LLSTRING(ConvertedX), _count]] call BIS_fnc_3DENNotification;
    } else {
        hint format [LLSTRING(ConvertedX), _count];
    };

    copyToClipboard _code;
};

if (is3DEN) then {
    [LLSTRING(ConvertedNoObjects), 1] call BIS_fnc_3DENNotification;
} else {
    hint LLSTRING(ConvertedNoObjects);
};
