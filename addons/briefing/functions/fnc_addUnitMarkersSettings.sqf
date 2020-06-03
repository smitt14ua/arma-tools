#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на юнитов.
    Настройки брать из переменных.
---------------------------------------------------------------------------- */

[
    GVAR(unitMarkers_showRole),
    GVAR(unitMarkers_alpha),
    GVAR(unitMarkers_showGroup)
] call FUNC(addUnitMarkers)