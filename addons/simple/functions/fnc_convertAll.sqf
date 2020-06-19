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
            } forEach (all3DENEntities select 0);
            [_objects] call FUNC(convert);
        }
    ],
    [
        LELSTRING(Common,No),
        {}
    ]
] call BIS_fnc_3DENShowMessage;