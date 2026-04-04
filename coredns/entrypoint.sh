#!/bin/sh
set -eu

: "${RFC2136_TSIG_SECRET:?RFC2136_TSIG_SECRET is required}"

printf 'key "externaldns-key" {\n    algorithm hmac-sha256;\n    secret "%s";\n};\n' "${RFC2136_TSIG_SECRET}" > /tmp/externaldns.key

exec named -u 1000 -c /etc/bind/named.conf -g
