#include <fcntl.h>
#include <unistd.h>

#include "log.h"

FILE *kmsg = NULL;
static int fd;

int log_open(void)
{
        fd = open("/dev/kmsg", O_WRONLY | O_NONBLOCK | O_CLOEXEC);
        if (fd == -1) {
                error("failed to open '/dev/kmsg'");
                return -1;
        }

        kmsg = fdopen(fd, "w");
        if (!kmsg) {
                error("failed to get stream for '/dev/kmsg'");
                close(fd);
                return -1;
        }

        return 0;
}

int log_close(void)
{
        if (!kmsg)
                return 0;

        return fclose(kmsg);
}
