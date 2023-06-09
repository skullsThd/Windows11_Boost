section .text
    global _start

_start:
    ; Disabilita l'esecuzione di codice dalla memoria dati
    xor eax, eax
    mov cr0, eax

    ; Crea una chiave casuale per la crittografia
    mov eax, 0x12345678
    mov ebx, 0x9abcdef0
    xor eax, ebx
    mov esi, eax ; Chiave di crittografia

    ; Esegui la crittografia dei dati
    mov ecx, 0 ; Contatore per la lunghezza dei dati da crittografare
loop_encryption:
    mov dl, [edi + ecx] ; Carica un byte di dato
    xor dl, sil ; Esegui la XOR con la chiave di crittografia
    mov [edi + ecx], dl ; Salva il byte crittografato
    inc ecx ; Incrementa il contatore
    cmp ecx, len ; Verifica se tutti i dati sono stati crittografati
    jl loop_encryption

    ; Effettua altre misure di sicurezza o azioni desiderate

    ; Termina il programma
    mov eax, 1
    xor ebx, ebx
    int 0x80
