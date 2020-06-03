#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Перевод выделенных объектов в редакторе в простые.
---------------------------------------------------------------------------- */

[
    LLSTRING(WarningBeforeConvert),
    LLSTRING(ConvertSelected),
    [
        LELSTRING(Common,Yes),
        {
            private _objects = get3DENSelected "object";
            [_objects] call FUNC(convert);
        }
    ],
    [
        LELSTRING(Common,No),
        {}
    ]
] call BIS_fnc_3DENShowMessage;