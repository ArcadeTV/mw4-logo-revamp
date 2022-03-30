### Hack idea
ChaddyBones


### GFX Packs Pointers:
C0000-C12FF

#### Logo GFX Packs
1024 ($400) Bytes per Pack
```
C0EF8:  02_13910C   ; second half is logo
C0EFC:  02_1392A3
C1080:  02_148AC0 
C1084:  02_148C97 
C1088:  02_148E24 
C108C:  02_148F9F
```

### Original Logo in VRAM
IDs     450-4FA     ($AA/#170 Tiles)
Offset  8A00-9F40   ($1540 Bytes)

### Original Logo Sprite Table
6D13C-6D177

```
01: 0B 24 EF 60 A8 ; 24x32
02: 0B 24 E3 70 88 ; 24x32
03: 0E 24 D7 10 90 ; 32x24
04: 0E 24 CB F0 90 ; 32x24
05: 0E 24 BF D0 90 ; 32x24
06: 0F 24 AF 30 88 ; 32x32
07: 0F 3C A0 C0 A8 ; 32x32
08: 0F 24 90 50 88 ; 32x32
09: 0F 24 80 40 A8 ; 32x32
10: 0F 24 70 20 A8 ; 32x32
11: 0F 24 50 E0 A8 ; 32x32
12: 0F 24 60 00 A8 ; 32x32
    FF
```

### Instructions to call sprite-building
3F38: jsr sub_1106 (nop nop)