#include "script_component.hpp"

ISNILS(GVAR(unitMarkers),[]);

{
    private _marker = str _x;
    if (_marker in GVAR(unitMarkers)) then {
        deleteMarkerLocal _marker;
    };
    createMarkerLocal [_marker, getPosWorld _x];
    _marker setMarkerTypeLocal "hd_dot";
    switch (side _x) do {
        case west: {
            _marker setMarkerColorLocal "colorBLUFOR";
        };
        case east: {
            _marker setMarkerColorLocal "colorOPFOR";
        };
        case resistance: {
            _marker setMarkerColorLocal "colorIndependent";
        };
        case civilian: {
            _marker setMarkerColorLocal "colorCivilian";
        };
        default {
            _marker setMarkerColorLocal "ColorUNKNOWN";
        };
    };
} forEach playableUnits;