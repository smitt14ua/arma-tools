#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на технику / статическое оружие.
---------------------------------------------------------------------------- */

params [["_showName", false, [true]], ["_alpha", 1, [0]]];

// Инициализируем массив маркеров
// Создаём, если его еще не существует
ISNILS(GVAR(vehicleMarkers),[]);

private _objects= [];

{
    private _object = _x;
    {
        if (_object isKindOf _x) then {
            _objects pushBack _object;
        };
    } forEach [
        "Car",
        "Helicopter",
        "Motorcycle",
        "Plane",
        "Ship",
        "StaticWeapon",
        "Submarine",
        "TrackedAPC",
        "Tank",
        "WheeledAPC"
    ];
} forEach allMissionObjects "";

{
    private _marker = "vehicle_" + str _x;

    // Удалить маркер, если уже существует
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
        private _name = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
        _text = _text + _name;
        _marker setMarkerTextLocal _text;
    };
} forEach vehicles;