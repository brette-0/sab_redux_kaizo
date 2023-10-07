@echo off
asm6 test.t.asm export.bin
export.py
cd ..\..\..
build.bat
pause