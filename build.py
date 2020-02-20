"""This script will build all addons into pbo files"""

from tools import sqf_validator as validator
import shutil
import os
import sys
import json
from platform import system
import subprocess

# GLOBALS
THIS_FILE_PATH = os.path.dirname(os.path.realpath(sys.argv[0]))
BUILD_PREFRENCES = dict()
USER_OS = system()
ARMAKE = None

def preferences():
    """Checks the user's preferences for build. In case there is no preferences file,
    walks the user to create a new one"""

    global BUILD_PREFRENCES
    
    if  not os.path.isfile("build_config.json"):
        print("Couldn't find build preferences file.")
        print("Let's create one...")
        print()
        print("Where do you want to put your built mod? [absolute path/blank to use this path]")
        answer = input()

        if answer is "":
            BUILD_PREFRENCES["MOD_DIR"] = THIS_FILE_PATH
        else:
            BUILD_PREFRENCES["MOD_DIR"] = answer

        with open("build_config.json", "w", encoding="UTF-8") as file:
            json.dump(BUILD_PREFRENCES, file, indent=4, sort_keys=True)
    
    else:
        with open("build_config.json", "r", encoding="UTF-8") as file:
            BUILD_PREFRENCES = json.load(file)

def check_system_os():
    """Checks the user current OS and assigns relevant ARMAKE"""

    global ARMAKE

    valid_os = ["Linux", "Windows"]
    if not USER_OS in valid_os:
        raise OSError ("Your OS is not currently supported or couldn't be identified!")

    elif USER_OS == "Linux":
        ARMAKE =  os.path.abspath("tools/armake")
    elif USER_OS == "Windows":
        ARMAKE = os.path.abspath("tools/armake_w64.exe")

def clean_mod_folder():
    """Deletes @CoopR folders"""

    root_coopr = "@CoopR"
    copy_coopr = os.path.join(BUILD_PREFRENCES["MOD_DIR"], "@CoopR")

    for folder in [root_coopr, copy_coopr]:
        if os.path.isdir(folder):
            try:
                shutil.rmtree(folder)
            except Exception as e:
                print("Something went wrong trying to clean mod directory!")
                print(str(e))

def create_mod_folders():
    """Creates @CoopR folders"""

    root_coopr = "@CoopR"

    try:
        os.makedirs(root_coopr, exist_ok=True)
        os.makedirs(os.path.join(root_coopr, "addons"), exist_ok=True)
        os.makedirs(os.path.join(root_coopr, "keys"), exist_ok=True)
    except Exception as e:
        print("Something went wrong trying to create mod folders!")
        print(str(e))  

def build_pbos():
    """Build the pbos from all the folders inside addons"""
    
    print()
    
    addons = os.listdir(os.path.join(THIS_FILE_PATH, "addons"))
    dest = os.path.join(THIS_FILE_PATH, "@CoopR", "addons")

    if not os.path.isdir(os.path.join(THIS_FILE_PATH, "addons")):
        raise FileNotFoundError("ERROR: I couldn't find your addons folder!")

    if not os.path.isdir(dest):
        raise FileNotFoundError("ERROR: I couldn't find your destination folder!")

    total_builds = 0
    
    for addon in addons:
        origin = os.path.abspath(os.path.join(THIS_FILE_PATH, "addons", addon))
        built = os.path.abspath(os.path.join(dest, f"{addon}.pbo"))

        if USER_OS == "Windows":
            build_order = f"{ARMAKE} build -p -f {origin} {built}"
        elif USER_OS == "Linux":
            build_order = f"{ARMAKE} build -p -f {origin} {built}"
        
        print(f"Building {addon}.pbo...")
        try:
            result = subprocess.run(build_order, capture_output=True)
            result.stdout = result.stdout.decode("UTF-8")
            result.stderr = result.stderr.decode("UTF-8")

            if result.stdout != "" or result.stderr != "":
                print(result.stderr)
                raise Exception(f"\nArmake silently broke trying to perform this order:\n{build_order}\n\n")

        except Exception as e:
            print(f"\nSomething went wrong while trying to build {addon}!")
            print(str(e))
        else:
            total_builds +=1
    print(f"\n{total_builds}/{len(addons)} Addons built!\n")
    total_errors = len(addons) - total_builds
    
    return total_errors

def copy_modcpp():
    """Copy mod.cpp to built mod folder"""
    
    origin = os.path.join(THIS_FILE_PATH, "mod.cpp")
    dest = os.path.join(THIS_FILE_PATH, "@CoopR", "mod.cpp")

    shutil.copyfile(origin, dest)

def copy_to_preference_folder():
    """If user specified another folder for his build, we copy @CoopR there"""

    if BUILD_PREFRENCES["MOD_DIR"] == THIS_FILE_PATH:
        return

    origin = os.path.join(THIS_FILE_PATH, "@CoopR")
    dest = os.path.join(BUILD_PREFRENCES["MOD_DIR"], "@CoopR")
    try:
        shutil.copytree(origin, dest)
    except Exception as e:
        print("Something went wrong copying mod folder to your preferred directory!")
        print(str(e))

def main():
    """Script entry point, modify execution order here"""

    preferences()
    check_system_os()
    validator.main()
    clean_mod_folder()
    create_mod_folders()
    errors = build_pbos()
    copy_modcpp()
    copy_to_preference_folder()

    print()
    
    if errors <= 0:
        cow = """
        __________________________
        / Build is done! Now go 
        do something with your life /
        ----------------------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\\
                    ||----w |
                    ||     ||

    """
    else:

        cow = """
        __________________________
        / Woops, we might have a 
        problem...                  /
        ----------------------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\\
                    ||----w |
                    ||     ||

    """
    print(cow)

if __name__ == "__main__":
    main()
else:
    print("How are you calling this script? You need to call it directly!")
    print("Exiting without doing anything...")

