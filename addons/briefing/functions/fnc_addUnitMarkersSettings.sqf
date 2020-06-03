#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на юнитов.
    Настройки брать из переменных.
---------------------------------------------------------------------------- */

[
    GVAR(unitMarkers_showRole),
    GVAR(unitMarkers_showGroup),
    GVAR(unitMarkers_alpha)
] call FUNC(addUnitMarkers)