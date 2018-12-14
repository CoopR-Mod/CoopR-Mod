:: This cmd script will build all addons into .pbo files and copies them
:: into the @CoopR folder in the root directory

SET armake64="tools\armake_w64.exe"
SET validator="tools\sqf_validator.py"
SET dest="@CoopR\addons"

python %validator%

rmdir /Q /S "@CoopR"
mkdir %dest%

%armake64% build -p addons\character %dest%\character.pbo
%armake64% build -p addons\core %dest%\core.pbo
%armake64% build -p addons\death %dest%\death.pbo
%armake64% build -p addons\equipment %dest%\equipment.pbo
%armake64% build -p addons\eventhandler %dest%\eventhandler.pbo
%armake64% build -p addons\init %dest%\init.pbo
%armake64% build -p addons\integration %dest%\integration.pbo
%armake64% build -p addons\intel %dest%\intel.pbo
%armake64% build -p addons\lobby %dest%\lobby.pbo
%armake64% build -p addons\reputation %dest%\reputation.pbo
%armake64% build -p addons\supply %dest%\supply.pbo

copy mod.cpp @CoopR\mod.cpp