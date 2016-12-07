:: Make sure that the Borland C++ compiler is on %PATH%
:: before running this file to build the HexDump utility.
::
:: Norman Dunbar April 2016


bcc32c -o HexDump.exe ..\HexDump\*.c
if exist HexDump.pdb (
    del /f HexDump.pdb 2>nul
)

if exist HexDump.tds (
    del /f HexDump.tds 2>nul
)

pause

