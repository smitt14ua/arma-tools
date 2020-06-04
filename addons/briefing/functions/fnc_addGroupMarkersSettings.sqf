#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Добавить маркера на группы.
    Настройки брать из переменных.
---------------------------------------------------------------------------- */

[
    GVAR(groupMarkers_showName),
    GVAR(groupMarkers_showCount),
    GVAR(groupMarkers_alpha)
] call FUNC(addGroupMarkers)