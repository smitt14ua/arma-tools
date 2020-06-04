#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на группы.
---------------------------------------------------------------------------- */

params [["_showName", false, [true]], ["_showCount", false, [true]], ["_alpha", 1, [0]]];

// Инициализируем массив маркеров
// Создаём, если его еще не существует
ISNILS(GVAR(groupMarkers),[]);

{
    private _marker = str _x;

    // Обновить маркер, если уже существует
    if (_marker in GVAR(groupMarkers)) then {deleteMarkerLocal _marker};

    createMarkerLocal [_marker, getPosWorld leader _x];

    // Добавляем в массив, чтобы потом можно было удалить
    GVAR(groupMarkers) pushBack _marker;

    _marker setMarkerTypeLocal "o_inf";

    // Выбираем цвет в зависимости от стороны
    switch (side _x) do {
        case west: {
            _marker setMarkerColorLocal "ColorWEST";
        };
        case east: {
            _marker setMarkerColorLocal "ColorEAST";
        };
        case resistance: {
            _marker setMarkerColorLocal "ColorGUER";
        };
        case civilian: {
            _marker setMarkerColorLocal "ColorCIV";
        };
        default {
            _marker setMarkerColorLocal "ColorUNKNOWN";
        };
    };

    _marker setMarkerAlphaLocal _alpha;

    private _text = "";

    // Название группы
    if (_showName) then {
        _name = groupId _x;
        // Пробел в конце для разделения названия и кол-ва людей
        _text = (_text + _name + " ");
        _marker setMarkerTextLocal _text;
    };

    // Кол-во членов группы
    if (_showCount) then {
        _count = count units _x;
        _text = _text + format ["(x%1)", _count];
        _marker setMarkerTextLocal _text;
    };
} forEach allGroups;