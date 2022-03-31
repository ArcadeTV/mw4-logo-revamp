## Monster World IV Logo Revamp

This project started as an idea and graphical mockup of [ChaddyBones](http://www.romhacking.net/forum/index.php?action=profile;u=15553). It replaces the MWIV logo with the 2022 remake version.

- Report any issues [here](https://github.com/ArcadeTV/mw4-logo-revamp/issues)
- See [commits](https://github.com/ArcadeTV/mw4-logo-revamp/commits/main) in main branch for a brief changelog.

---

#### How to use the patch:

You need:
- [x] The [latest release](https://github.com/ArcadeTV/mw4-logo-revamp/releases/latest) from the releases tab. <br>Extract the .bps patch file.
- [x] The ROM "Monster World IV (USA, Europe) (En,Ja) (Virtual Console).md"<br>(CRC AF050C46)
- [x] [flips](https://dl.smwcentral.net/11474/floating.zip) to apply the patch file to your ROM.

1. Open flips.exe
2. Click "Apply Patch"
3. Select the .bps Datei
4. Select the orginal ROM
5. Save the patched file

---

```
 _____               _     _____ _____ 
|  _  |___ ___ ___ _| |___|_   _|  |  |
|     |  _|  _| .'| . | -_| | | |  |  |
|__|__|_| |___|__,|___|___| |_|  \___/ 
                             

Title:          Monster World IV Logo Revamp, GFX Romhack
System:         SEGA GENESIS / MEGA DRIVE
               

Compatibility:  Works on real hardware with 
                MEGA Everdrive Pro, 
                MegaSD* or 
                any other (Flash or Repro) Cart
                mister*
                as well as most emulators

Date:           2022-03-30

Category:       Romhack / GFX
               
Source:         https://github.com/ArcadeTV/mw4-logo-revamp

Original idea:  ChaddyBones

```

### How to build from source

#### Windows

- Clone this repository into a local directory.
- Navigate into the folder you cloned and setup the tools `git clone https://github.com/ArcadeTV/tools`.
- Put the needed source ROM into the `roms` folder.
- Execute the `build.bat` file that is provided within the repository.

You may want to install `tools\win\vcredist_x86.exe` as a dependency for some commandline tools if you run into an error.
