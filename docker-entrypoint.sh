#!/bin/bash
set -e

# Set HOST env variable for Heroku review apps
if [ -z "$HOST" ] && [ -n "$HEROKU_APP_NAME" ]; then
  export HOST=$HEROKU_APP_NAME.herokuapp.com
fi

bin/currency_watch eval 'CurrencyWatch.Release.migrate'

exec "$@"
