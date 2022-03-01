#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Очистить историю переводов в простые объекты.
---------------------------------------------------------------------------- */

["В связи с оккупацией Украины солдатами РФ работа данного аддона временно прекращена.", "Работа прекращена", "Нет войне!", false] call BIS_fnc_3DENShowMessage;

// [
//     LLSTRING(WarningBeforeClearConversions),
//     LLSTRING(ClearConversions),
//     [
//         LELSTRING(Common,Yes),
//         {
//             uiNamespace setVariable [QGVAR(conversions), ""];
//             [LLSTRING(ConversionsCleared)] call BIS_fnc_3DENNotification;
//         }
//     ],
//     [
//         LELSTRING(Common,No),
//         {}
//     ]
// ] call BIS_fnc_3DENShowMessage;