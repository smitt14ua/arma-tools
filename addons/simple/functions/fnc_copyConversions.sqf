#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Скопировать код всех конвертаций.
---------------------------------------------------------------------------- */

private _code = uiNamespace getVariable [QGVAR(conversions), ""];

copyToClipboard _code;

[LLSTRING(Copied)] call BIS_fnc_3DENNotification;