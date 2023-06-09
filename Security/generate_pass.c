#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define PASSWORD_LENGTH 12

char* generatePassword() {
    char* password = malloc((PASSWORD_LENGTH + 1) * sizeof(char));

    // Caratteri utilizzabili nella password
    char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()";

    // Inizializza il generatore di numeri casuali
    srand(time(NULL));

    // Genera la password carattere per carattere
    for (int i = 0; i < PASSWORD_LENGTH; i++) {
        int index = rand() % (sizeof(charset) - 1);
        password[i] = charset[index];
    }

    password[PASSWORD_LENGTH] = '\0';  // Termina la stringa con il carattere nullo

    return password;
}

int main() {
    // Genera la password casuale
    char* password = generatePassword();

    printf("La tua nuova password sicura e' : %s\n", password);

    // Libera la memoria allocata per la password
    free(password);

    return 0;
}
