#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Удалить маркера на группы.
---------------------------------------------------------------------------- */

if (isNil QGVAR(groupMarkers) || {IS_EMPTY(GVAR(groupMarkers))}) exitWith {};

{deleteMarker _x} forEach GVAR(groupMarkers);

GVAR(groupMarkers) = [];