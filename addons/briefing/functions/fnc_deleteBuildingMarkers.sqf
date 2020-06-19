#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Удалить маркера на постройки.
---------------------------------------------------------------------------- */

if (isNil QGVAR(buildingMarkers) || {IS_EMPTY(GVAR(buildingMarkers))}) exitWith {};

{deleteMarker _x} forEach GVAR(buildingMarkers);

GVAR(buildingMarkers) = [];