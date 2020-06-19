#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Перевод всех объектов в редакторе в простые.
---------------------------------------------------------------------------- */

[
    LLSTRING(WarningBeforeConvert),
    LLSTRING(ConvertAllButSelected),
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
            _objects = _objects - (get3DENSelected "object");
            [_objects] call FUNC(convert);
        }
    ],
    [
        LELSTRING(Common,No),
        {}
    ]
] call BIS_fnc_3DENShowMessage;