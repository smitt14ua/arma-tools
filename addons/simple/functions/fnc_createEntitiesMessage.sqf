#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Создание объектов из скопированного кода.
    Только сообщение с подтверждением действия.
---------------------------------------------------------------------------- */

["В связи с оккупацией Украины солдатами РФ работа данного аддона временно прекращена.", "Работа прекращена", "Нет войне!", false] call BIS_fnc_3DENShowMessage;

// [
//     LLSTRING(WarningBeforeCreating),
//     LLSTRING(CreateFromClipboad),
//     [
//         LELSTRING(Common,Yes),
//         {
//             call FUNC(createEntities);
//         }
//     ],
//     [
//         LELSTRING(Common,No),
//         {}
//     ]
// ] call BIS_fnc_3DENShowMessage;