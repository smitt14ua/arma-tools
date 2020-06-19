#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Создание объектов из скопированного кода.
    Только сообщение с подтверждением действия.
---------------------------------------------------------------------------- */

[
    LLSTRING(WarningBeforeCreating),
    LLSTRING(CreateFromClipboad),
    [
        LELSTRING(Common,Yes),
        {
            call FUNC(createEntities);
        }
    ],
    [
        LELSTRING(Common,No),
        {}
    ]
] call BIS_fnc_3DENShowMessage;