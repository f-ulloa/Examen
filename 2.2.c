#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t mutex;
pthread_mutex_t barrier_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t barrier_cond = PTHREAD_COND_INITIALIZER;
const int NUM_THREADS = 3;

typedef struct {
    int id;
    int tiene_pase;
    int trajo_comida;
} thread_data;

void barrier_wait(int tiene_pase, int trajo_comida) {
    pthread_mutex_lock(&barrier_mutex);
    if (!tiene_pase || !trajo_comida) {
        pthread_cond_wait(&barrier_cond, &barrier_mutex);
    }
    pthread_mutex_unlock(&barrier_mutex);
}

void *thread(void *arg) {
    thread_data *data = (thread_data *)arg;
    int id = data->id;
    int tiene_pase = data->tiene_pase;
    int trajo_comida = data->trajo_comida;

    barrier_wait(tiene_pase, trajo_comida);

    sem_wait(&mutex);
    printf("Thread %d: Entered..\n", id);

    sleep(2);

    printf("Thread %d: Just Exiting...\n", id);
    sem_post(&mutex);

    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];
    thread_data thread_args[NUM_THREADS];

    sem_init(&mutex, 0, 2);

    thread_args[0].id = 1;
    thread_args[0].tiene_pase = 1;
    thread_args[0].trajo_comida = 1;
    thread_args[1].id = 2;
    thread_args[1].tiene_pase = 0; 
    thread_args[1].trajo_comida = 1;
    thread_args[2].id = 3;
    thread_args[2].tiene_pase = 0;
    thread_args[2].trajo_comida = 0;

    for (int i = 0; i < NUM_THREADS; ++i) {
        pthread_create(&threads[i], NULL, thread, (void *)&thread_args[i]);
    }

    for (int i = 0; i < NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
    }

    sem_destroy(&mutex); // Destrucción del semáforo

    return 0;
}
