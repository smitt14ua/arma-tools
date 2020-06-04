#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Удалить маркера на технику / статическое оружие.
---------------------------------------------------------------------------- */

if (isNil QGVAR(vehicleMarkers) || {IS_EMPTY(GVAR(vehicleMarkers))}) exitWith {};

{deleteMarker _x} forEach GVAR(vehicleMarkers);

GVAR(vehicleMarkers) = [];