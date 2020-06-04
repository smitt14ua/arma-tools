#include "script_component.hpp"

/* ----------------------------------------------------------------------------
    Получить текст для вкладки Маркеры.
---------------------------------------------------------------------------- */

// Инициализация переменных-параметров

ISNILS(GVAR(unitMarkers_showGroup),false);
ISNILS(GVAR(unitMarkers_showRole),true);
ISNILS(GVAR(unitMarkers_alpha),1);

ISNILS(GVAR(groupMarkers_showName),true);
ISNILS(GVAR(groupMarkers_showCount),true);
ISNILS(GVAR(groupMarkers_alpha),1);

private _xml = "";

// Юниты

_xml = _xml + "<font size=16>" + LLSTRING(Units) + "</font><br/>";

// Показывать роль (юнитов)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(UnitRoleDesc)];

if (GVAR(unitMarkers_showRole)) then {
    _xml = _xml + format [
        "<execute expression='%1 = false; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showRole),
        (if (IS_EMPTY(GVAR(unitMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = true; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showRole),
        (if (IS_EMPTY(GVAR(unitMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
};

// Показывать группу (юнитов)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(GroupName)];

if (GVAR(unitMarkers_showGroup)) then {
    _xml = _xml + format [
        "<execute expression='%1 = false; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showGroup),
        (if (IS_EMPTY(GVAR(unitMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = true; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_showGroup),
        (if (IS_EMPTY(GVAR(unitMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
};

// Прозрачность (юнитов)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(Opacity)];

if (GVAR(unitMarkers_alpha) > 0.4) then {
    _xml = _xml + format [
        "<execute expression='%1 = 0.4; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_alpha),
        (if (IS_EMPTY(GVAR(unitMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Half)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = 1; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(unitMarkers_alpha),
        (if (IS_EMPTY(GVAR(unitMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addUnitMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Full)
    ];
};

// Переключить видимость (юнитов)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(Visibility)];

if (IS_EMPTY(GVAR(unitMarkers))) then {
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

// Группы

_xml = _xml + "<font size=16>" + LLSTRING(Groups) + "</font><br/>";

// Показывать имя (групп)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(GroupName)];

if (GVAR(groupMarkers_showName)) then {
    _xml = _xml + format [
        "<execute expression='%1 = false; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(groupMarkers_showName),
        (if (IS_EMPTY(GVAR(GroupMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addGroupMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = true; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(groupMarkers_showName),
        (if (IS_EMPTY(GVAR(GroupMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addGroupMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
};

// Показывать кол-во людей (групп)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(UnitsCount)];

if (GVAR(groupMarkers_showCount)) then {
    _xml = _xml + format [
        "<execute expression='%1 = false; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(groupMarkers_showCount),
        (if (IS_EMPTY(GVAR(GroupMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addGroupMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = true; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(groupMarkers_showCount),
        (if (IS_EMPTY(GVAR(GroupMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addGroupMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
};

// Прозрачность (групп)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(Opacity)];

if (GVAR(groupMarkers_alpha) > 0.4) then {
    _xml = _xml + format [
        "<execute expression='%1 = 0.4; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(groupMarkers_alpha),
        (if (IS_EMPTY(GVAR(groupMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addGroupMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Half)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='%1 = 1; %2[""%3""] call CBA_fnc_localEvent;'>%4</execute><br/>",
        QGVAR(groupMarkers_alpha),
        (if (IS_EMPTY(GVAR(groupMarkers))) then {""} else {
            format ["[] call %1;", QFUNC(addGroupMarkersSettings)]
        }),
        QGVAR(updateMarkersDiary),
        LLSTRING(Full)
    ];
};

// Переключить видимость (групп)

_xml = _xml + format ["<font color='#99cccc'>%1</font>: ", LLSTRING(Visibility)];

if (IS_EMPTY(GVAR(groupMarkers))) then {
    _xml = _xml + format [
        "<execute expression='[] call %1; [""%2""] call CBA_fnc_localEvent;'>%3</execute><br/>",
        QFUNC(addGroupMarkersSettings),
        QGVAR(updateMarkersDiary),
        LLSTRING(Show)
    ];
} else {
    _xml = _xml + format [
        "<execute expression='[] call %1; [""%2""] call CBA_fnc_localEvent;'>%3</execute><br/>",
        QFUNC(deleteGroupMarkers),
        QGVAR(updateMarkersDiary),
        LLSTRING(Hide)
    ];
};

_xml