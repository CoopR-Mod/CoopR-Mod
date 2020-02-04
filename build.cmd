:: This cmd script will build all addons into .pbo files and copies them
:: into the @CoopR folder in the root directory

SET armake64="tools\armake_w64.exe"
SET validator="tools\sqf_validator.py"
SET dest="@CoopR\addons"
SET keys="@CoopR\keys"

python %validator%

rmdir /Q /S "@CoopR"
mkdir %dest%
mkdir %keys%

%armake64% build -p addons\persistence %dest%\persistence.pbo
%armake64% build -p addons\core %dest%\core.pbo
%armake64% build -p addons\integration %dest%\integration.pbo
%armake64% build -p addons\rpg %dest%\rpg.pbo
%armake64% build -p addons\lobby %dest%\lobby.pbo
%armake64% build -p addons\supply %dest%\supply.pbo
%armake64% build -p addons\missions %dest%\missions.pbo
%armake64% build -p addons\campsite %dest%\campsite.pbo
%armake64% build -p addons\hq %dest%\hq.pbo
%armake64% build -p addons\groups %dest%\groups.pbo

copy mod.cpp @CoopR\mod.cpp
