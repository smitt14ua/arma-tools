_objects = allMissionObjects "Static";
_objects append allMissionObjects "Thing";
_objects = _objects - (get3DENSelected "object");

_objects call st_simple_fnc_convertBase;