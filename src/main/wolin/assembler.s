; setupSPF=251[ubyte],40959[uword]


; prepare function stack
__wolin_spf = 251 ; function stack ptr
__wolin_spf_top = 40959 ; function stack top
    lda #<__wolin_spf_top ; set function stack top
    sta __wolin_spf
    lda #>__wolin_spf_top
    sta __wolin_spf+1

; setupSP=143[ubyte]


; prepare program stack
__wolin_sp_top = 143 ; program stack top
    ldx #__wolin_sp_top ; set program stack top

; goto__wolin_pl_qus_wolin_main[adr]

    jmp __wolin_pl_qus_wolin_main

; allocSP<__wolin_reg0>,#1

    dex

; letSP(0)<__wolin_reg0>[ubyte]=#2[ubyte]


    lda #2
    sta 0,x

; let__wolin_pl_qus_wolin_b<pl.qus.wolin.b>[ubyte]=SP(0)<__wolin_reg0>[ubyte]


    lda 0,x
    sta __wolin_pl_qus_wolin_b


; freeSP<__wolin_reg0>,#1

    inx

; label__wolin_pl_qus_wolin_main

__wolin_pl_qus_wolin_main:

; allocSP<__wolin_reg2>,#1

    dex

; allocSP<__wolin_reg3>,#1

    dex

; allocSP<__wolin_reg4>,#2


    dex
    dex

; letSP(0)<__wolin_reg4>[uword]=__wolin_pl_qus_wolin_d<pl.qus.wolin.d>[uword]


    lda #<__wolin_pl_qus_wolin_d
    sta 0,x
    lda #>__wolin_pl_qus_wolin_d
    sta 0+1,x

; allocSP<__wolin_reg5>,#1

    dex

; allocSP<__wolin_reg6>,#1

    dex

; label__wolin_lab_whenLabel_0

__wolin_lab_whenLabel_0:

; letSP(0)<__wolin_reg6>[ubyte]=#0[ubyte]


    lda #0
    sta 0,x

; evaleqSP(1)<__wolin_reg5>[bool]=SP(2)<__wolin_reg4>[uword],SP(0)<__wolin_reg6>[ubyte]


    lda #0 // rozne
    sta 1,x
    lda 2+1,x
    bne +
    lda 2,x
    cmp 0,x
    bne +
    lda #1 // rowne
    sta 1,x
:

; bneSP(1)<__wolin_reg5>[bool]=#1[bool],__wolin_lab_whenLabel_1[adr]


    lda 1,x
    cmp #1
    bne __wolin_lab_whenLabel_1

; letSP(0)<__wolin_reg6>[ubyte]=#6[ubyte]


    lda #6
    sta 0,x

; goto__wolin_lab_whenEndLabel_0[adr]

    jmp __wolin_lab_whenEndLabel_0

; label__wolin_lab_whenLabel_1

__wolin_lab_whenLabel_1:

; letSP(0)<__wolin_reg6>[ubyte]=#1[ubyte]


    lda #1
    sta 0,x

; evaleqSP(1)<__wolin_reg5>[bool]=SP(2)<__wolin_reg4>[uword],SP(0)<__wolin_reg6>[ubyte]


    lda #0 // rozne
    sta 1,x
    lda 2+1,x
    bne +
    lda 2,x
    cmp 0,x
    bne +
    lda #1 // rowne
    sta 1,x
:

; bneSP(1)<__wolin_reg5>[bool]=#1[bool],__wolin_lab_whenLabel_2[adr]


    lda 1,x
    cmp #1
    bne __wolin_lab_whenLabel_2

; letSP(0)<__wolin_reg6>[ubyte]=#7[ubyte]


    lda #7
    sta 0,x

; goto__wolin_lab_whenEndLabel_0[adr]

    jmp __wolin_lab_whenEndLabel_0

; label__wolin_lab_whenLabel_2

__wolin_lab_whenLabel_2:

; letSP(0)<__wolin_reg6>[ubyte]=#9[ubyte]


    lda #9
    sta 0,x

; label__wolin_lab_whenEndLabel_0

__wolin_lab_whenEndLabel_0:

; letSP(4)<__wolin_reg3>[ubyte]=SP(0)<__wolin_reg6>[ubyte]


    lda 0,x
    sta 4,x

; freeSP<__wolin_reg6>,#1

    inx

; freeSP<__wolin_reg5>,#1

    inx

; freeSP<__wolin_reg4>,#2


    inx
    inx

; let__wolin_pl_qus_wolin_b<pl.qus.wolin.b>[ubyte]=SP(0)<__wolin_reg3>[ubyte]


    lda 0,x
    sta __wolin_pl_qus_wolin_b


; freeSP<__wolin_reg3>,#1

    inx

; freeSP<__wolin_reg2>,#1

    inx

; ret

    rts

; label__wolin_indirect_jsr

__wolin_indirect_jsr:

; goto65535[adr]

    jmp 65535

; label__wolin_pl_qus_wolin_b

__wolin_pl_qus_wolin_b:

; alloc0[ubyte]

    .byte 0

; label__wolin_pl_qus_wolin_c

__wolin_pl_qus_wolin_c:

; alloc0[uword]

    .word 0

; label__wolin_pl_qus_wolin_d

__wolin_pl_qus_wolin_d:

; alloc0[uword]

    .word 0

