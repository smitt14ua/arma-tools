#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на группы.
    Не работает с простыми объектами :(
    Цвета:
    0 - Серый (по умолчанию)
    1 - Оранжевый
---------------------------------------------------------------------------- */

params [["_color", 0, [0]], ["_alpha", 1, [0]]];

// Инициализируем массив маркеров
// Создаём, если его еще не существует
ISNILS(GVAR(buildingMarkers),[]);

private _objects = [];

{
    if (
        _x isKindOf "Building"
        || {
            _x isKindOf "Thing"
            && {"Ammo" != getText (configFile >> "CfgVehicles" >> typeOf _x >> "vehicleClass")}
        }
    ) then {
        _objects pushBack _x;
    }
} forEach (allMissionObjects "");

{
    private _marker = "building_" + str _x;

    // Удалить маркер, если уже существует
    if (_marker in GVAR(buildingMarkers)) then {deleteMarkerLocal _marker};

    createMarkerLocal [_marker, getPosWorld _x];

    // Добавляем в массив, чтобы потом можно было удалить
    GVAR(buildingMarkers) pushBack _marker;

    _marker setMarkerBrushLocal "SolidFull";
    _marker setMarkerShapeLocal "RECTANGLE";
    _marker setMarkerDirLocal getDir _x;

    // Размеры объекта
    private _bbox = 2 boundingBoxReal _x;
    private _size = _bbox select 1;
    _size resize 2;

    _marker setMarkerSize _size;

    // Выбираем цвет в зависимости от стороны
    switch (_color) do {
        case 0: {
            _marker setMarkerColorLocal "ColorGrey";
        };
        case 1: {
            _marker setMarkerColorLocal "ColorOrange";
        };
        default {
            _marker setMarkerColorLocal "ColorGrey";
        };
    };

    _marker setMarkerAlphaLocal _alpha;
} forEach _objects;