#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

// Estructura de monitor
typedef struct {
    pthread_mutex_t lock;
    pthread_cond_t cond;
    int turn; // 0 para hilo 1, 1 para hilo 2
} Monitor;

Monitor monitor;

void init_monitor(Monitor *m) {
    pthread_mutex_init(&m->lock, NULL);
    pthread_cond_init(&m->cond, NULL);
    m->turn = 0; // El hilo 1 comienza
}

void destroy_monitor(Monitor *m) {
    pthread_mutex_destroy(&m->lock);
    pthread_cond_destroy(&m->cond);
}

void *worker(void *arg) {
    int my_turn = *(int *)arg;
    for (int i = 0; i < 3; i++) {
        pthread_mutex_lock(&monitor.lock);
        while (monitor.turn != my_turn) {
            pthread_cond_wait(&monitor.cond, &monitor.lock);
        }
        // Simula el uso del recurso
        printf("Hilo %d: Usando el recurso\n", my_turn + 1);
        sleep(1); // Simula trabajo
        monitor.turn = 1 - monitor.turn; // Cambia el turno
        pthread_cond_broadcast(&monitor.cond);
        pthread_mutex_unlock(&monitor.lock);
    }
    return NULL;
}

int main() {
    pthread_t t1, t2;
    int turns[2] = {0, 1};

    init_monitor(&monitor);

    pthread_create(&t1, NULL, worker, &turns[0]);
    pthread_create(&t2, NULL, worker, &turns[1]);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    destroy_monitor(&monitor);
    return 0;
}
