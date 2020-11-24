; This is an assembly version of the following C code (assuming a, b and c are already declared)
;
; for(int i=0;i<6;i++) {
; a[i] = b[i] + c[i];
; }
.data
a: .space 48
b: .word 10,11,12,13,0,1
c: .word 1,2,3,4,5,6
.text

;initialize registers
daddi r1,r0,a
daddi r2,r0,b
daddi r3,r0,c
daddi r4,r0,6
Loop:   lw      r5,0(r2) ; element of b
        lw      r6,0(r3) ; element of c
        daddi   r2,r2,8
        daddi   r3,r3,8
        dadd    r7,r5,r6 ; a[i] = b[i] + c[i];
        daddi   r4,r4,-1 ; i++
        sw      r7,0(r1) ; store value in a[i]
        daddi   r1,r1,8 ; increment memory pointers
        bnez    r4,Loop
end:    halt