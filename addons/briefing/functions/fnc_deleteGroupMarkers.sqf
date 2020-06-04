#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Удалить маркера на группы.
---------------------------------------------------------------------------- */

if (isNil QGVAR(groupMarkers) || {GVAR(groupMarkers) isEqualTo []}) exitWith {};

{deleteMarker _x} forEach GVAR(groupMarkers);

GVAR(groupMarkers) = [];