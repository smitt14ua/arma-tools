#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Получить текст для вкладки Маркеры.
---------------------------------------------------------------------------- */

private _xml = "";

if (isNil QGVAR(unitMarkers_showRole)) then {
    GVAR(unitMarkers_showRole) = true;
};

if (isNil QGVAR(unitMarkers_showGroup)) then {
    GVAR(unitMarkers_showGroup) = true;
};

if (isNil QGVAR(unitMarkers_alpha)) then {
    GVAR(unitMarkers_alpha) = 1;
};

// Юниты
_xml = _xml + "<font size=16>" + LLSTRING(Units) + "</font><br/>";

// Показывать роль
_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(UnitRoleDesc)];
if (GVAR(unitMarkers_showRole)) then {
    _xml = _xml + format [
        "<execute expression='%1 = false; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showRole),
        (if (GVAR(unitMarkers) isEqualTo []) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = true; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showRole),
        (if (GVAR(unitMarkers) isEqualTo []) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
};

// Показывать группу
_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(UnitGroupName)];
if (GVAR(unitMarkers_showGroup)) then {
    _xml = _xml + format [
        "<execute expression='%1 = false; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showGroup),
        (if (GVAR(unitMarkers) isEqualTo []) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = true; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showGroup),
        (if (GVAR(unitMarkers) isEqualTo []) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
};

// Прозрачность
_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(UnitOpacity)];
if (GVAR(unitMarkers_alpha) > 0.4) then {
    _xml = _xml + format [
        "<execute expression='%1 = 0.4; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_alpha),
        (if (GVAR(unitMarkers) isEqualTo []) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Half)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = 1; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_alpha),
        (if (GVAR(unitMarkers) isEqualTo []) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Full)
    ];
};

// Переключить видимость
_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(Visibility)];
if (GVAR(unitMarkers) isEqualTo []) then {
    _xml = _xml + format [
        "<execute expression='[] call %1; [""%2""] call CBA_fnc_localEvent;'>%3</execute><br/>",
        QFUNC(addUnitMarkersSettings),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='[] call %1; [""%2""] call CBA_fnc_localEvent;'>%3</execute><br/>",
        QFUNC(deleteUnitMarkers),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
};
_xml = _xml + "<br/>";
_xml