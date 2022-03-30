@echo off
CLS

REM -----------------------------------------------------------------------------------------------
REM Check Source ROM

IF EXIST ".\roms\Monster World IV (USA, Europe) (En,Ja) (Virtual Console).md" (
	.\tools\win\checkhash.exe ".\roms\Monster World IV (USA, Europe) (En,Ja) (Virtual Console).md" 6ED8588492F963015BA173CD4FC0CB6A2680BB6374FD930FCAD757605DCFD70D > NUL && echo Source ROM passed file check. || echo Incorrect Source Rom. Aborting. && exit /b
) ELSE (
	echo Source ROM not found. Aborting.
  exit /b
)



REM -----------------------------------------------------------------------------------------------
REM delete any old versions

if exist ".\roms\Monster World IV (Logo Revamp)[ChaddyBones, ArcadeTV].md" (
  DEL ".\roms\Monster World IV (Logo Revamp)[ChaddyBones, ArcadeTV].md"
  echo Deleted old ROM file>.\tmp\build.log
)



REM -----------------------------------------------------------------------------------------------
REM patch the ROM

echo Building...
.\tools\win\vasmm68k_mot_win32.exe .\patch.asm -quiet -chklabels -nocase -rangewarnings -Dvasm=1 -L tmp\Listing.txt -DBuildGEN=1 -Fbin -Fsrec -o tmp\srecfile.txt
.\tools\win\srecpatch.exe ".\roms\Monster World IV (USA, Europe) (En,Ja) (Virtual Console).md" ".\roms\Monster World IV (Logo Revamp)[ChaddyBones, ArcadeTV].md"<.\tmp\srecfile.txt>>.\tmp\build.log



REM -----------------------------------------------------------------------------------------------
REM fix the checksum in the header

.\tools\win\fixheader.exe ".\roms\Monster World IV (Logo Revamp)[ChaddyBones, ArcadeTV].md"
echo fixed header checksum>>.\tmp\build.log



REM -----------------------------------------------------------------------------------------------
REM create bps patchfile

.\tools\win\flips.exe --create ".\roms\Monster World IV (USA, Europe) (En,Ja) (Virtual Console).md" ".\roms\Monster World IV (Logo Revamp)[ChaddyBones, ArcadeTV].md" ".\roms\Monster World IV (Logo Revamp)[ChaddyBones, ArcadeTV].bps"



echo done!