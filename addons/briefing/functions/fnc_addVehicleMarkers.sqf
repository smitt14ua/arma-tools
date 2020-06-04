#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на технику / статическое оружие.
---------------------------------------------------------------------------- */

params [["_showName", false, [true]], ["_alpha", 1, [0]]];

{
    private _marker = str _x;

    // Обновить маркер, если уже существует
    if (_marker in GVAR(vehicleMarkers)) then {deleteMarkerLocal _marker};

    createMarkerLocal [_marker, getPosWorld _x];

    // Добавляем в массив, чтобы потом можно было удалить
    GVAR(vehicleMarkers) pushBack _marker;

    _marker setMarkerTypeLocal "hd_dot";
    _marker setMarkerColorLocal "ColorWhite";
    _marker setMarkerAlphaLocal _alpha;

    private _text = "";

    // Название техники
    if (_showName) then {
        _name = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
        _text = _text + _name;
        _marker setMarkerTextLocal _text;
    };
} forEach vehicles;