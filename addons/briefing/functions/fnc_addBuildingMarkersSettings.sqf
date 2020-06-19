#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на постройки.
    Настройки брать из переменных.
---------------------------------------------------------------------------- */

[
    GVAR(buildingMarkers_color),
    GVAR(buildingMarkers_alpha)
] call FUNC(addBuildingMarkers)