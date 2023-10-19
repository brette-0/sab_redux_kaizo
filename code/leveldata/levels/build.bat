@echo off
set /p WandL ="Enter name of Level:"
asm6 test.t.asm export.bin
python -m export %WandL%
cd ..\..\..
build.bat
pause