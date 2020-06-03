#include "\x\cba\addons\main\script_macros_common.hpp"

#undef PATHTO_FNC
#define PATHTO_FNC(func) class func {\
    file = QPATHTOF(functions\DOUBLES(fnc,func).sqf);\
    CFGFUNCTION_HEADER;\
    RECOMPILE;\
}

#define SETVAR_SYS(namespace,varName,value) namespace setVariable [QUOTE(varName), value]
#define MSETVAR(varName,value) SETVAR_SYS(missionNamespace,varName,value)
#define USETVAR(varName,value) SETVAR_SYS(uiNamespace,varName,value)
#define PSETVAR(varName,value) SETVAR_SYS(profileNamespace,varName,value)

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#include "script_debug.hpp"