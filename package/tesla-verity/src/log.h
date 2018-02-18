#ifndef _VERITY_INIT_LOG_H
#define _VERITY_INIT_LOG_H

#include <stdio.h>
#include <errno.h>
#include <string.h>

extern FILE *kmsg;

#define info(s,...)  do { \
                        printf("verity-init: info: " s "\n", ## __VA_ARGS__); \
                        fflush(stdout); \
                        if (kmsg) { \
                                fprintf(kmsg, "verity-init: info: " s "\n", ## __VA_ARGS__); \
                                fflush(kmsg); \
                        } \
                     } while (0)

#define error(s,...) do { \
                        fprintf(stderr, "verity-init: error: " s ": %s\n", ## __VA_ARGS__, strerror (errno)); \
                        fflush(stderr); \
                        if (kmsg) { \
                                fprintf(kmsg, "verity-init: error: " s ": %s\n", ## __VA_ARGS__, strerror (errno)); \
                                fflush(kmsg); \
                        } \
                     } while (0)

int log_open(void);
int log_close(void);

#endif
