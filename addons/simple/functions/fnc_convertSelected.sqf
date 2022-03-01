#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Перевод выделенных объектов в редакторе в простые.
---------------------------------------------------------------------------- */

["В связи с оккупацией Украины солдатами РФ работа данного аддона временно прекращена.", "Работа прекращена", "Нет войне!", false] call BIS_fnc_3DENShowMessage;

// [
//     LLSTRING(WarningBeforeConvert),
//     LLSTRING(ConvertSelected),
//     [
//         LELSTRING(Common,Yes),
//         {
//             private _objects = get3DENSelected "object";
//             [_objects] call FUNC(convert);
//         }
//     ],
//     [
//         LELSTRING(Common,No),
//         {}
//     ]
// ] call BIS_fnc_3DENShowMessage;