В этой задаче Вам необходимо описать рекурсивную функцию F(x), которая вычисляет количество единиц в троичной записи числа. Функция должна удовлетворять соглашениям о вызовах cdecl.

На вход программе подается 32-битное беззнаковое число x.

Программа должна вывести единственное число — значение F(x).


%include "io.inc"
section .bss
    n resd 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, n
    mov eax, 0
    push dword[n]
    call F
    add esp, 4
    PRINT_DEC 4, eax
    xor eax, eax
    ret
    
F:
    push ebp
    mov ebp, esp
    push esi
    mov esi, 3
    mov ecx, eax
    mov eax, dword[ebp + 8]
    mov edx, 0
    div esi
    cmp edx, 1
    je TR
    jmp FL
TR: 
    inc ecx
FL:
    mov edx, eax
    mov eax, ecx
    cmp edx, 0
    je T
    push edx
    call F
    add esp, 4
T: 
    pop esi
    pop ebp
    ret
