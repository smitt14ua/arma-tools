#include "script_component.hpp"

[QGVAR(updateMarkersDiary), {
    player setDiaryRecordText [
        [QEGVAR(common,diarySubject), GVAR(markersDiary)],
        [
            LLSTRING(DiaryMarkersDisplayName),
            format [
                "<font size=20>%1</font><br/>%2",
                LLSTRING(DiaryMarkersDisplayName),
                call FUNC(getMarkersRecordText)
            ]
        ]
    ];
}] call CBA_fnc_addEventHandler;

{
    GVAR(markersDiary) = player createDiaryRecord [
        [QEGVAR(common,diarySubject),
        [
            LLSTRING(DiaryMarkersDisplayName),
            format [
                "<font size=20>%1</font><br/>%2",
                LLSTRING(DiaryMarkersDisplayName),
                call FUNC(getMarkersRecordText)
            ]
        ],
        taskNull,
        "",
        false
    ];
} call CBA_fnc_execNextFrame;