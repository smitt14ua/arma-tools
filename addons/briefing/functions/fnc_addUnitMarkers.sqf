#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на юнитов.
---------------------------------------------------------------------------- */

params [["_showRole", false, [true]], ["_alpha", 1, [0]], ["_showGroup", false, [true]]];

// Инициализируем массив маркеров
// Создаём, если его еще не существует
ISNILS(GVAR(unitMarkers),[]);

{
    private _marker = str _x;

    // Обновить маркер, если уже существует
    if (_marker in GVAR(unitMarkers)) then {deleteMarkerLocal _marker};

    createMarkerLocal [_marker, getPosWorld _x];

    // Добавляем в массив, чтобы потом можно было удалить
    GVAR(unitMarkers) pushBack _marker;

    _marker setMarkerTypeLocal "hd_dot";

    // Выбираем цвет в зависимости от стороны
    switch (side _x) do {
        case west: {
            _marker setMarkerColorLocal "colorBLUFOR";
        };
        case east: {
            _marker setMarkerColorLocal "colorOPFOR";
        };
        case resistance: {
            _marker setMarkerColorLocal "colorIndependent";
        };
        case civilian: {
            _marker setMarkerColorLocal "colorCivilian";
        };
        default {
            _marker setMarkerColorLocal "ColorUNKNOWN";
        };
    };

    _marker setMarkerAlphaLocal _alpha;

    private _text = "";

    // Название группы
    if (_showGroup) then {
        _groupName = groupId (group _x);
        // Пробел в конце для разделения группы и роли
        _text = (_text + _groupName + " ");
        _marker setMarkerTextLocal _text;
    };

    // Номер в группе и роль игрока
    if (_showRole) then {
        _name = roleDescription _x;
        if (_name == "") then {
            _name = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
        };
        _text = _text + format [
            "%1: %2",
            [_x] call CBA_fnc_getGroupIndex,
            _name
        ];
        _marker setMarkerTextLocal _text;
    };
} forEach allUnits;