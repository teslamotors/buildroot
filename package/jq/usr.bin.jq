#include <tunables/global>

/usr/bin/jq flags=(attach_disconnected) {
    /etc/ld.so.cache mr,
    /usr/bin/jq mr,
    /lib/*.so* mr,
    /usr/lib/*.so* mr,
}
