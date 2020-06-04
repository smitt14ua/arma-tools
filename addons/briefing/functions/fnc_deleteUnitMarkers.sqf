#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Удалить маркера на юнитов.
---------------------------------------------------------------------------- */

if (isNil QGVAR(unitMarkers) || {IS_EMPTY(GVAR(unitMarkers))) exitWith {};

{deleteMarker _x} forEach GVAR(unitMarkers);

GVAR(unitMarkers) = [];