#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Удалить маркера на юнитов.
---------------------------------------------------------------------------- */

if (isNil QGVAR(unitMarkers) || {GVAR(unitMarkers) isEqualTo []}) exitWith {};

{deleteMarker _x} forEach GVAR(unitMarkers);

GVAR(unitMarkers) = [];