На стандартном потоке ввода задается число N(1 ≤ N ≤ 100000), а следом за ним N целых беззнаковых 32-битных чисел.

Для каждого из N чисел необходимо вывести YES, если число данное число делится на три, и NO в противном случае. 
Ответы должны быть разделены переводом строки.

Указание: использовать массивы и инструкции деления запрещается, необходимо описать функцию div3, проверяющую делимость своего аргумента на 3.

Подсказка: Для решения данной задачи может быть полезным вспомнить признак деления чисел на 11.


%include "io.inc"
section .bss
    n resd 1
    tp resd 1

section .text
global CMAIN
CMAIN:
    GET_DEC 4, n
    mov ecx, dword[n]
    mov eax, 0
START:
    cmp ecx, 0
    jz END
    GET_UDEC 4, tp 
    push dword[tp]
    call F
    add esp, 4
    dec ecx
    jmp START
END:
    xor eax, eax
    ret
    
F:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    mov eax, dword[ebp + 8]
    mov edi, 1
    mov esi, 32
    mov edx, 1
    mov ebx, 0
ST:
    cmp ebx, 32
    je EN
    and edi, eax
    cmp edx, 1
    je TR
    sub esi, edi
    inc edx
    jmp FL
TR:
    add esi, edi
    dec edx
FL:
    inc ebx
    mov edi, 1
    shr eax, 1
    jmp ST
EN:
    cmp esi, 32
    jge TRT
    mov eax, 32
    sub eax, esi
    jmp FLF
TRT:
    sub esi, 32
    mov eax, esi
FLF:
    mov edx, 0
    mov esi, 3
    div esi
    cmp edx, 0
    je TRR
    PRINT_STRING "NO"
    jmp FLL
TRR:
    PRINT_STRING "YES"
FLL:
    NEWLINE
    pop ebx
    pop esi
    pop edi
    pop ebp
    ret
