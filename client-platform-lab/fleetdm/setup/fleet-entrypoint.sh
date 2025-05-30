#!/bin/sh
set -e

# Run DB prepare once before starting Fleet
fleet prepare db

# Then start Fleet server *without TLS*
fleet serve --no-tls