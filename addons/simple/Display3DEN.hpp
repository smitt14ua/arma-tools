class ctrlMenu;
class ctrlMenuStrip;
class Display3DEN {
    class ContextMenu: ctrlMenu {
        class Items {
            items[] += {QGVAR(convert)};
            class GVAR(convert) {
                picture = "\s\tools\addons\common\ui\icon_ca.paa";
                text = CSTRING(ContextMenuDisplayName);
                conditionShow = "selectedObject * (1 - selectedWaypoint) * (1 - selectedLogic) * (1 - selectedMarker)";
                items[] = {
                    QGVAR(convertSelected),
                    QGVAR(convertAllButSelected)
                };
                value = 0;
            };
            class GVAR(convertSelected) {
                text = CSTRING(ConvertSelected);
                action = QUOTE(call FUNC(convertSelected));
            };
            class GVAR(convertAllButSelected) {
                text = CSTRING(ConvertAllButSelected);
                action = QUOTE(call FUNC(convertAllButSelected));
            };
        };
    };
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Tools {
                    items[] += {QGVAR(convert)};
                };
                class GVAR(convert) {
                    text = CSTRING(MenuDisplayName);
                    picture = "\s\tools\addons\common\ui\icon_ca.paa";
                    items[] = {
                        QGVAR(convertAll),
                        QGVAR(convertSelected),
                        QGVAR(convertAllButSelected),
                        QGVAR(copyConversions),
                        QGVAR(copyConversionLatest),
                        QGVAR(clearConversions)
                    };
                };
                class GVAR(convertAll) {
                    text = CSTRING(ConvertAll);
                    action = QUOTE(call FUNC(convertAll));
                };
                class GVAR(convertSelected) {
                    text = CSTRING(ConvertSelected);
                    action = QUOTE(call FUNC(convertSelected));
                };
                class GVAR(convertAllButSelected) {
                    text = CSTRING(ConvertAllButSelected);
                    action = QUOTE(call FUNC(convertAllButSelected));
                };
                class GVAR(copyConversions) {
                    text = CSTRING(CopyConversions);
                    action = QUOTE(call FUNC(copyConversions));
                };
                class GVAR(copyConversionLatest) {
                    text = CSTRING(CopyConversionLatest);
                    action = QUOTE(call FUNC(copyConversionLatest));
                };
                class GVAR(clearConversions) {
                    text = CSTRING(ClearConversions);
                    action = QUOTE(call FUNC(clearConversions));
                };
            };
        };
    };
};