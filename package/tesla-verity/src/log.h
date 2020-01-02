#ifndef _VERITY_INIT_LOG_H
#define _VERITY_INIT_LOG_H

#include <stdio.h>
#include <errno.h>
#include <string.h>

extern FILE *kmsg;

#define log(stream, level, fmt, ...) \
do { \
        fprintf(stream, "verity-init: %s: " fmt "\n", level, ## __VA_ARGS__); \
        fflush(stream); \
        if (kmsg) { \
                fprintf(kmsg, "verity-init: %s: " fmt "\n", level, ## __VA_ARGS__); \
                fflush(kmsg); \
        } \
} while (0)

#define info(fmt, ...) log(stdout, "info", fmt, ## __VA_ARGS__)
#define warning(fmt, ...) log(stderr, "warning", fmt, ## __VA_ARGS__)
#define error(fmt, ...) log(stderr, "error", fmt, ## __VA_ARGS__)

int log_open(void);
int log_close(void);

#endif
