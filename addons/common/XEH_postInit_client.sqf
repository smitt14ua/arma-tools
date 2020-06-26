#include "script_component.hpp"

{
    // Вкладка Инструменты на экране брифинга (карте)
    player createDiarySubject [QGVAR(diarySubject), LLSTRING(Diary)];
} call CBA_fnc_execNextFrame;