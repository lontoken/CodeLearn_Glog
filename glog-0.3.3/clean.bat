@echo off
del *.~* /Q /S /F
del *.log /Q /S /F
del *.exe /Q /S /F
del *.tlog /Q /S /F
del *.pdb /Q /S /F
del *.obj /Q /S /F
del *.rc /Q /S /F
del *.res /Q /S /F
del *.manifest /Q /S /F
del *.idb /Q /S /F
del *.ipch /Q /S /F
del *.unsuccessfulbuild /Q /S /F
del *.lastbuildstate /Q /S /F

del Debug /Q /S /F
del ipch /Q /S /F
del Release /Q /S /F   
echo. & pause