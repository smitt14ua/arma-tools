#include "script_component.hpp"

if (!hasInterface) exitWith {};

[QGVAR(updateMarkersDiary), {
    player setDiaryRecordText [
        [QGVAR(diarySubject), GVAR(markersDiary)],
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
    player createDiarySubject [QGVAR(diarySubject), LLSTRING(DiaryDisplayName)];
    GVAR(markersDiary) = player createDiaryRecord [
        QGVAR(diarySubject),
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