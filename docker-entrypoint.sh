#!/bin/bash
set -e

bin/currency_watch eval 'CurrencyWatch.Release.migrate'

exec "$@"
