#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Перевод всех объектов в редакторе в простые.
---------------------------------------------------------------------------- */

[
    LLSTRING(WarningBeforeConvert),
    LLSTRING(ConvertAll),
    [
        LELSTRING(Common,Yes),
        {
            private _objects = allMissionObjects "Static";
            _objects append allMissionObjects "Thing";
            [_objects] call FUNC(convert);
        }
    ],
    [
        LELSTRING(Common,No),
        {}
    ]
] call BIS_fnc_3DENShowMessage;