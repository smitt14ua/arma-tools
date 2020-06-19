#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Базовая функция для перевода объектов в простые.
---------------------------------------------------------------------------- */

params ["_objects"];

private _code = "";
private _count = count _objects;

private _fnc_posToStr = {
    params ["_array", ["_decimals", 20]];
    format [
        "[%1,%2,%3]",
        (_array select 0) toFixed _decimals,
        (_array select 1) toFixed _decimals,
        (_array select 2) toFixed _decimals
    ]
};

{
    private _modelPath = (getModelInfo _x) # 1;
    private _position = getPosWorld _x;
    private _edenPosition = _x get3DENAttribute "position";
    private _edenRotation = _x get3DENAttribute "rotation";
    private _vectorDir = vectorDir _x;
    private _vectorUp = vectorUp _x;

    _code = [
        _code,
        format ["// %1 / %2 / %3", typeOf _x, _edenPosition call _fnc_posToStr, _edenRotation call _fnc_posToStr], endl,
        "_temp = createSimpleObject [", str _modelPath, ", ", [_position] call _fnc_posToStr, ", true];", endl, 
        "_temp setVectorDirAndUp [", [_vectorDir] call _fnc_posToStr, ", ", [_vectorUp] call _fnc_posToStr, "];", endl
    ] joinString "";

    if (!is3DEN) then {deleteVehicle _x};
} forEach _objects;

if (is3DEN) then {delete3DENEntities _objects};

if (_count > 0) exitWith {
    private _conversions = uiNamespace getVariable [QGVAR(conversions), ""];
    _conversions = _conversions + _code;
    uiNamespace setVariable [QGVAR(conversions), _conversions];
    uiNamespace setVariable [QGVAR(conversionLatest), _code];

    [format [LLSTRING(ConvertedX), _count]] call BIS_fnc_3DENNotification;

    copyToClipboard _code;
};

[LLSTRING(ConvertedNoObjects), 1] call BIS_fnc_3DENNotification;
