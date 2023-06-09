#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <ifaddrs.h>

void getIPAddress() {
    struct ifaddrs *ifaddr, *ifa;
    char host[NI_MAXHOST];

    if (getifaddrs(&ifaddr) == -1) {
        perror("Errore durante la lettura degli indirizzi IP.");
        return;
    }

    printf("Indirizzi IP:\n");

    for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
        if (ifa->ifa_addr == NULL || ifa->ifa_addr->sa_family != AF_INET) {
            continue;
        }

        int s = getnameinfo(ifa->ifa_addr, sizeof(struct sockaddr_in),
                            host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);
        if (s != 0) {
            printf("Errore durante la risoluzione dell'indirizzo IP: %s\n", gai_strerror(s));
            return;
        }

        printf("%s: %s\n", ifa->ifa_name, host);
    }

    freeifaddrs(ifaddr);
}

int main() {
    getIPAddress();

    return 0;
}
