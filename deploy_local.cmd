:: This cmd script will copy the @CoopR build target folder to the designated
:: arma 3 mod directory. Change "dest" to your own local arma3 mod directory

SET modpath="C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@CoopR\"
SET dest="C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\"
rmdir /Q /S %modpath%
xcopy /E /H "@CoopR" %modpath%

