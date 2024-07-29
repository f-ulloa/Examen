#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t *mutex;
pthread_mutex_t barrier_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t barrier_cond = PTHREAD_COND_INITIALIZER;
int barrier_count = 0;
const int NUM_THREADS = 4;

void barrier_wait() {
    pthread_mutex_lock(&barrier_mutex);
    barrier_count++;
    if (barrier_count == NUM_THREADS) {
        pthread_cond_broadcast(&barrier_cond);
    } else {
        pthread_cond_wait(&barrier_cond, &barrier_mutex);
    }
    pthread_mutex_unlock(&barrier_mutex);
}

void *thread(void *arg) {
    int id = *(int *)arg;
    barrier_wait();

    sem_wait(mutex);
    printf("Thread %d: Entered..\n", id);

    sleep(2);

    printf("Thread %d: Just Exiting...\n", id);
    sem_post(mutex);

    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];
    int ids[NUM_THREADS];

    sem_unlink("/mysemaphore");

    mutex = sem_open("/mysemaphore", O_CREAT, 0644, 2);
    if (mutex == SEM_FAILED) {
        perror("sem_open failed");
        return 1;
    }

    for (int i = 0; i < NUM_THREADS; i++) {
        ids[i] = i + 1;
        pthread_create(&threads[i], NULL, thread, &ids[i]);
    }

    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    sem_close(mutex);
    sem_unlink("/mysemaphore");

    return 0;
}
