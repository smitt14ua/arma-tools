#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Создание объектов из скопированного кода.
    Информация берётся только из комментариев в коде.
    Пример:
    // Land_BarGate_F / [[2997.38,1899.07,-1.52588e-005]] / [[0,0,50.3724]]
---------------------------------------------------------------------------- */

["В связи с оккупацией Украины солдатами РФ работа данного аддона временно прекращена.", "Работа прекращена", "Нет войне!", false] call BIS_fnc_3DENShowMessage;

// private _clipboard = copyFromClipboard;
// private _clipboardLines = _clipboard splitString toString [13,10];

// private _toCreate = [];

// {
//     // Проверка на комментарий
//     if (_x select [0, 2] == "//") then {
//         // Делим на компоненты
//         private _splited = (_x splitString " /");
//         if (count _splited == 3) then {
//             _splited params ["_className", "_positionString", "_rotationString"];
//             // Преобразовуем строки в массивы
//             private _position = parseSimpleArray _positionString;
//             private _rotation = parseSimpleArray _rotationString;
//             if (count _position isEqualTo 3 && {count _rotation isEqualTo 3}) then {
//                 _toCreate pushBack [_className, _position, _rotation];
//             };
//         };
//     };
// } forEach _clipboardLines;

// if (count _toCreate isEqualTo 0) exitWith {
//     [LLSTRING(CreatedNoObjects), 1] call BIS_fnc_3DENNotification;
// };

// // Используем или создаём отдельный слой
// private _layerID = uiNamespace getVariable [QGVAR(layerID), -1];

// if (not (_layerID in (all3DENEntities select 6))) then {
//     _layerID = -1 add3DENLayer LLSTRING(RecreatedLayerDisplayName);
//     uiNamespace setVariable [QGVAR(layerID), _layerID];
// };

// // Объединяем все создания в один шаг истории,
// // чтобы можно было отменить одним нажатием Ctrl + Z
// collect3DENHistory {
//     {
//         _x params ["_className", "_position", "_rotation"];
//         private _entity = create3DENEntity ["Object", _className, _position];
//         _entity set3DENAttribute ["position", _position];
//         _entity set3DENAttribute ["rotation", _rotation];
//         _entity set3DENLayer _layerID;
//     } forEach _toCreate;
// };

// [format [LLSTRING(CreatedX), count _toCreate]] call BIS_fnc_3DENNotification;