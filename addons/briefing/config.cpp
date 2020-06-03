#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QUOTE(MAIN_ADDON)};
        author = ECSTRING(main,author);
        authors[] = {"Smith"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"