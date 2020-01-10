:: configure with own paths to mpmissions!!!
SET mpmissions="C:\Users\xetra11\Documents\Arma 3\mpmissions"
SET dest="C:\Program Files (x86)\Steam\steamapps\common\Arma 3\x\coopr\demo_missions"

xcopy /E /H /R /Y %mpmissions%"\its.stratis" %dest%"\its.stratis\"
xcopy /E /H /R /Y %mpmissions%"\dev.vr\*" %dest%"\dev.vr\"
