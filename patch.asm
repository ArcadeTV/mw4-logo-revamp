; #################################################################################################
; #                                   LOGO REVAMP (GFX ROMHACK)                                   #
; #                    Monster World IV (USA, Europe) (En,Ja) (Virtual Console)                   #
; #                   for SEGA GENESIS - v1.0 2022-03-30, ChaddyBones, ArcadeTV                   #
; #################################################################################################
; =================================================================================================
; CHANGELOG
; =================================================================================================
; v1.0 : 2022-03-30
; - Draw an entirely new logo on the title screen
; #################################################################################################

    org     $A18
    jmp     bypassSpriteTable
    nop 
ret_bypassSpriteTable:                      ; just a label


    ;org     $3F38                           ; suppress calling the routine to build the original logo sprites
    ;nop
    ;nop


    ; Overwrite GFX Pack locations in absolute table:
    org     $C0EF8
    dc.l    gfxPack1+$02000000
    org     $C0EFC
    dc.l    gfxPack2+$02000000
    org     $C1080
    dc.l    gfxPack3+$02000000
    org     $C1084
    dc.l    gfxPack4+$02000000
    org     $C1088
    dc.l    gfxPack5+$02000000
    org     $C108C
    dc.l    gfxPack6+$02000000



    org     $164AE0 ; --------------------------- Free Space from here --------------------------------------

bypassSpriteTable:
    movea.l $FFFFA01E(a4),a3                    ; adopt original instruction
    cmp.l   #$0006D13C,a3                       ; Is it the original logo sprite table?
    bne.s   skip                                ; if not resume original instructions
    move.l  #ModifiedSpriteTable,a3             ; if yes, use custom address for sprite table
    move.l  a3,$FFFFA01E(a4)                    ; also in RAM, just in case
skip:
    movea.w $FFFFA32A(a4),a2                    ; adopt original instruction
    jmp     ret_bypassSpriteTable               ; jump back

    ; DATA: Sprite Table ------------------------------------------------------------------------------------
ModifiedSpriteTable:
    ;       siz,pid,id2,xpo,ypo
    dc.b    $0F,($4|%01000000),$50,($00-64),$88 ; 16 tiles, 32x32
    dc.b    $0F,($4|%01000000),$60,($20-64),$88 ; 16 tiles, 32x32
    dc.b    $0F,($4|%01000000),$70,($40-64),$88 ; 16 tiles, 32x32
    dc.b    $0F,($4|%01000000),$80,($60-64),$88 ; 16 tiles, 32x32
    dc.b    $0F,($4|%01000000),$90,($80-64),$88 ; 16 tiles, 32x32
    dc.b    $0B,($4|%01000000),$A0,($A0-64),$88 ; 12 tiles, 24x32
    dc.b    $05,($4|%01000000),$AC,($B8-64),$88 ;  4 tiles, 16x16

    dc.b    $0E,($4|%01000000),$B0,($00-64),$A8 ; 12 tiles, 32x24
    dc.b    $0A,($4|%01000000),$BC,($20-64),$A8 ;  9 tiles, 24x24
    dc.b    $07,($4|%01000000),$C5,($38-64),$A8 ;  8 tiles, 16x32
    dc.b    $0E,($4|%01000000),$CD,($48-64),$A8 ; 12 tiles, 32x24
    dc.b    $0E,($4|%01000000),$D9,($68-64),$A8 ; 12 tiles, 32x24
    dc.b    $0E,($4|%01000000),$E5,($88-64),$A8 ; 12 tiles, 32x24
    dc.b    $06,($4|%01000000),$F1,($A8-64),$A8 ;  6 tiles, 16x24
    dc.b    $FF

; 00: 8x8
; 01: 8x16
; 02: 8x24
; 03: 8x32
; 04: 16x8
; 05: 16x16
; 06: 16x24
; 07: 16x32
; 08: 24x8
; 09: 24x16
; 0A: 24x24
; 0B: 24x32
; 0C: 32x8
; 0D: 32x16
; 0E: 32x24
; 0F: 32x32


    ; DATA: GFX ---------------------------------------------------------------------------------------------
gfxPack1:
    incbin "includes/bin/gfx/alternative/tiledata_1.cbin"
gfxPack2:
    incbin "includes/bin/gfx/alternative/tiledata_2.cbin"
gfxPack3:
    incbin "includes/bin/gfx/alternative/tiledata_3.cbin"
gfxPack4:
    incbin "includes/bin/gfx/alternative/tiledata_4.cbin"
gfxPack5:
    incbin "includes/bin/gfx/alternative/tiledata_5.cbin"
gfxPack6:
    incbin "includes/bin/gfx/alternative/tiledata_6.cbin"
    