:: This cmd script will build all addons into .pbo files and copies them
:: into the @CoopR folder in the root directory

SET armake64="tools\armake_w64.exe"
SET validator="tools\sqf_validator.py"
SET dest="@CoopRLight\addons"
SET keys="@CoopRLight\keys"

python %validator%

rmdir /Q /S "@CoopRLight"
mkdir %dest%
mkdir %keys%

%armake64% build -p addons\core %dest%\core.pbo
%armake64% build -p addons\persistence %dest%\persistence.pbo
%armake64% build -p addons\integration %dest%\integration.pbo
%armake64% build -p addons\lobby %dest%\lobby.pbo

copy mod.cpp @CoopRLight\mod.cpp
