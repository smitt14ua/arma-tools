#!/usr/bin/env python3

import os
import sys
import subprocess

if sys.platform == "win32":
    import winreg

MAINPREFIX = "s"
PREFIX = "tools_"


def tryHemttBuild(projectpath):
    hemttExe = os.path.join(projectpath, "hemtt.exe")
    if os.path.isfile(hemttExe):
        os.chdir(projectpath)
        ret = subprocess.call([hemttExe, "pack"], stderr=subprocess.STDOUT)
        print("Using hemtt: {}".format(ret));
        return True
    else:
        print("hemtt not installed");
    return False

def mod_time(path):
    if not os.path.isdir(path):
        return os.path.getmtime(path)
    maxi = os.path.getmtime(path)
    for p in os.listdir(path):
        maxi = max(mod_time(os.path.join(path, p)), maxi)
    return maxi


def check_for_changes(addonspath, module):
    if not os.path.exists(os.path.join(addonspath, "{}{}.pbo".format(PREFIX, module))):
        return True
    return mod_time(os.path.join(addonspath, module)) > mod_time(os.path.join(addonspath, "{}{}.pbo".format(PREFIX, module)))


def check_for_obsolete_pbos(addonspath, file):
    module = file[len(PREFIX):-4]
    if not os.path.exists(os.path.join(addonspath, module)):
        return True
    return False


def main():
    print("# Сборка PBO")

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    addonspath = os.path.join(projectpath, "addons")

    if (tryHemttBuild(projectpath)): return

    made = 0
    failed = 0
    skipped = 0
    removed = 0

    print("")

    os.chdir(addonspath)

    for file in os.listdir(addonspath):
        if os.path.isfile(file):
            if check_for_obsolete_pbos(addonspath, file):
                removed += 1
                print("  Удаление лишнего файла " + file)
                os.remove(file)

    for p in os.listdir(addonspath):
        path = os.path.join(addonspath, p)
        if not os.path.isdir(path):
            continue
        if p[0] == ".":
            continue
        if not check_for_changes(addonspath, p):
            skipped += 1
            print("  Пропуск " + p)
            continue

        print("# Сборка " + p + " ...")

        cmd = [
            "makepbo",
            "-NUP",
            "-@={}\\{}\\addons\\{}".format(MAINPREFIX, PREFIX.rstrip("_"), p),
            p,
            "{}{}.pbo".format(PREFIX, p)
        ]

        try:
            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
        except:
            failed += 1
            print("  Ошибка сборки " + p)
        else:
            made += 1
            print("  Успешно собрано " + p)

    print("\n# Сборка окончена")
    print("  Собрано {}, пропущено {}, удалено {}, неудачно {} ".format(
        made, skipped, removed, failed))


if __name__ == "__main__":
    sys.exit(main())
