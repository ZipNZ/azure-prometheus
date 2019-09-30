#!/bin/bash
set -e
exec "$@" --web.listen-address="0.0.0.0:${PORT}"