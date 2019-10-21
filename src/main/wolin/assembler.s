; setupHEADER


;**********************************************
;*
;* BASIC header
;*
;* compile with:
;* cl65.exe -o assembler.prg -t c64 -C c64-asm.cfg -g -Ln labels.txt assembler.s
;*
;**********************************************
            .org 2049
            .export LOADADDR = *
Bas10:      .word BasEnd
            .word 10
            .byte 158 ; sys
            .byte " 2064"
            .byte 0
BasEnd:     .word 0
            .word 0
            ;


; setupSPF=251[ubyte],40959[uword]


; prepare function stack
__wolin_spf := 251 ; function stack ptr
__wolin_spf_hi := 251+1 ; function stack ptr

__wolin_spf_top := 40959 ; function stack top
__wolin_spf_top_hi := 40959+1 ; function stack top
    lda #<__wolin_spf_top ; set function stack top
    sta __wolin_spf
    lda #>__wolin_spf_top
    sta __wolin_spf+1

; setupSP=143[ubyte]


; prepare program stack
__wolin_sp_top := 143 ; program stack top
__wolin_sp_top_hi := 143+1 ; program stack top
    ldx #__wolin_sp_top ; set program stack top

; setupHEAP=176[ubyte]


__wolin_this_ptr := 176
__wolin_this_ptr_hi := 176+1


; let__wolin_pl_qus_wolin_znak<pl.qus.wolin.znak>[ubyte]=#0[ubyte]


    lda #0
    sta __wolin_pl_qus_wolin_znak

; let__wolin_pl_qus_wolin_i<pl.qus.wolin.i>[uword]=#0[ubyte]


    lda #<0
    sta __wolin_pl_qus_wolin_i
    lda #0
    sta __wolin_pl_qus_wolin_i+1

; allocSPF,#2


    clc
    lda __wolin_spf
    sbc #2
    sta __wolin_spf
    bcs :+
    dec __wolin_spf+1
:

; call__wolin_pl_qus_wolin_main[adr]

    jsr __wolin_pl_qus_wolin_main

; freeSPF<unit>,#0

 

; ret

    rts

; label__wolin_pl_qus_wolin_allocMem

__wolin_pl_qus_wolin_allocMem:

; letSPF(4)<returnValue>[uword]=#30000[uword]


    ldy #4
    lda #<30000
    sta (__wolin_spf),y
    iny
    lda #>30000
    sta (__wolin_spf),y

; freeSPF,#4


    clc
    lda __wolin_spf
    adc #4
    sta __wolin_spf
    bcc :+
    inc __wolin_spf+1
:

; ret

    rts

; label__wolin_pl_qus_wolin_SomeClass

__wolin_pl_qus_wolin_SomeClass:

; allocSP<__wolin_reg4>,#2


    dex
    dex

; allocSPF,#6


    clc
    lda __wolin_spf
    sbc #6
    sta __wolin_spf
    bcs :+
    dec __wolin_spf+1
:

; letSPF(2)[uword]=#3[uword]


    ldy #2
    lda #<3
    sta (__wolin_spf),y
    iny
    lda #>3
    sta (__wolin_spf),y

; letSPF(0)[uword]=#1[uword]


    ldy #0
    lda #<1
    sta (__wolin_spf),y
    iny
    lda #>1
    sta (__wolin_spf),y

; call__wolin_pl_qus_wolin_allocMem[adr]

    jsr __wolin_pl_qus_wolin_allocMem

; letSP(0)<__wolin_reg4>[any*]=SPF(0)<returnValue>[uword]


    ldy #0
    lda __wolin_spf,y
    sta 0
    iny
    lda __wolin_spf,y
    sta 0+1


; freeSPF<uword>,#2


    clc
    lda __wolin_spf
    adc #2
    sta __wolin_spf
    bcc :+
    inc __wolin_spf+1
:

; letSPF(0)<pl.qus.wolin.SomeClass.returnValue>[any*]=SP(0)<__wolin_reg4>[any*]


    lda 0,x
    ldy #0
    sta (__wolin_spf),y
    lda 0+1,x
    iny
    sta (__wolin_spf),y

; setupHEAP=SP(0)<__wolin_reg4>[any*]


    lda 0,x
    sta __wolin_this_ptr
    lda 0+1,x
    sta __wolin_this_ptr+1

; freeSP<__wolin_reg4>,#2


    inx
    inx

; letHEAP(2)<pl.qus.wolin.SomeClass.x>[ubyte]=#3[ubyte]


    lda #3
    ldy #2
    sta (__wolin_this_ptr),y

; letHEAP(1)<pl.qus.wolin.SomeClass.y>[ubyte]=#7[ubyte]


    lda #7
    ldy #1
    sta (__wolin_this_ptr),y

; ret

    rts

; label__wolin_pl_qus_wolin_SomeClass_suma

__wolin_pl_qus_wolin_SomeClass_suma:

; setupHEAP=this


    ldy #0 ; this pointer from SPF to this pointer on ZP
    lda (__wolin_spf),y
    sta __wolin_this_ptr
    iny
    lda (__wolin_spf),y
    sta __wolin_this_ptr+1

; allocSP<__wolin_reg8>,#2


    dex
    dex

; letSP(0)<__wolin_reg8>[ubyte*]=*HEAP(2)<pl.qus.wolin.SomeClass.x>[ubyte]


    clc
    lda __wolin_this_ptr
    adc #2
    sta 0,x
    lda __wolin_this_ptr+1
    adc #0
    sta 0+1,x

; add&SP(0)<__wolin_reg8>[ubyte*]=&SP(0)<__wolin_reg8>[ubyte*],HEAP(1)<pl.qus.wolin.SomeClass.y>[ubyte]


    clc
    lda (0,x)
    ldy #1
    adc (__wolin_this_ptr), y
    sta (0,x)


; letSPF(2)<returnValue>[ubyte]=&SP(0)<__wolin_reg8>[ubyte*]


    lda (0,x)
    ldy #2
    sta (__wolin_spf),y


; freeSP<__wolin_reg8>,#2


    inx
    inx

; freeSPF,#2


    clc
    lda __wolin_spf
    adc #2
    sta __wolin_spf
    bcc :+
    inc __wolin_spf+1
:

; ret

    rts

; label__wolin_pl_qus_wolin_main

__wolin_pl_qus_wolin_main:

; allocSP<__wolin_reg13>,#2


    dex
    dex

; letSP(0)<__wolin_reg13>[any*]=SPF(0)<pl.qus.wolin.main..testowa>[any*]


    ldy #0
    lda (__wolin_spf),y
    sta 0,x
    iny
    lda (__wolin_spf),y
    sta 0+1,x

; allocSP<__wolin_reg14>,#2


    dex
    dex

; allocSPF,#2


    clc
    lda __wolin_spf
    sbc #2
    sta __wolin_spf
    bcs :+
    dec __wolin_spf+1
:

; call__wolin_pl_qus_wolin_SomeClass[adr]

    jsr __wolin_pl_qus_wolin_SomeClass

; letSP(0)<__wolin_reg14>[any*]=SPF(0)<returnValue>[any*]


    ldy #0
    lda (__wolin_spf),y
    sta 0,x
    iny
    lda (__wolin_spf),y
    sta 0+1,x

; freeSPF<pl.qus.wolin.SomeClass>,#2


    clc
    lda __wolin_spf
    adc #2
    sta __wolin_spf
    bcc :+
    inc __wolin_spf+1
:

; freeSP<__wolin_reg14>,#2


    inx
    inx

; freeSP<__wolin_reg13>,#2


    inx
    inx

; allocSP<__wolin_reg16>,#2


    dex
    dex

; letSP(0)<__wolin_reg16>[ubyte*]=53280[ubyte*]


    lda #<53280
    sta 0,x
    lda #>53280
    sta 0+1,x

; allocSP<__wolin_reg19>,#1

    dex

; allocSPF,#3


    clc
    lda __wolin_spf
    sbc #3
    sta __wolin_spf
    bcs :+
    dec __wolin_spf+1
:

; call__wolin_pl_qus_wolin_SomeClass_suma[adr]

    jsr __wolin_pl_qus_wolin_SomeClass_suma

; letSP(0)<__wolin_reg19>[ubyte]=SPF(0)<returnValue>[ubyte]


    ldy #0
    lda (__wolin_spf),y
    sta 0,x


; freeSPF<ubyte>,#1


    clc
    lda __wolin_spf
    adc #1
    sta __wolin_spf
    bcc :+
    inc __wolin_spf+1
:

; freeSP<__wolin_reg19>,#1

    inx

; let&SP(0)<__wolin_reg16>[ubyte*]=SP(0)<__wolin_reg19>[ubyte]


    lda 0,x
    sta (0,x)

; freeSP<__wolin_reg16>,#2


    inx
    inx

; freeSPF,#2


    clc
    lda __wolin_spf
    adc #2
    sta __wolin_spf
    bcc :+
    inc __wolin_spf+1
:

; ret

    rts

; label__wolin_indirect_jsr

__wolin_indirect_jsr:

; goto65535[adr]

    jmp 65535

; label__wolin_pl_qus_wolin_znak

__wolin_pl_qus_wolin_znak:

; alloc0[ubyte]

    .byte 0

; label__wolin_pl_qus_wolin_i

__wolin_pl_qus_wolin_i:

; alloc0[uword]

    .word 0

