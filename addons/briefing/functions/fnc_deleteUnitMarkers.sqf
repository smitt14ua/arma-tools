#include "script_component.hpp"

if (isNil QGVAR(unitMarkers) || {GVAR(unitMarkers) isEqualTo []}) exitWith {};

{
    deleteMarker _x;
} forEach GVAR(unitMarkers);

GVAR(unitMarkers) = [];