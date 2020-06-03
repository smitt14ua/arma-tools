#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Очистить историю переводов в простые объекты.
---------------------------------------------------------------------------- */

[
    LLSTRING(WarningBeforeClearConversions),
    LLSTRING(ClearConversions),
    [
        LELSTRING(Common,Yes),
        {
            uiNamespace setVariable [QGVAR(conversions), ""];
            [LLSTRING(ConversionsCleared)] call BIS_fnc_3DENNotification;
        }
    ],
    [
        LELSTRING(Common,No),
        {}
    ]
] call BIS_fnc_3DENShowMessage;