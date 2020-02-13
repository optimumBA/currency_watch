FROM bitwalker/alpine-elixir-phoenix:latest AS builder

# Set build env
ENV MIX_ENV=prod

# Install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get --only prod
RUN mix deps.compile

# Build assets
COPY assets assets
RUN cd assets && \
    npm install && \
    npm run deploy
RUN mix phx.digest

# Build project
COPY priv priv
COPY lib lib
RUN mix compile

# Build release
RUN mix release

FROM bitwalker/alpine-erlang:latest

RUN mkdir /app
WORKDIR /app

COPY --from=builder /opt/app/_build/prod/rel/currency_watch ./
RUN chown -R nobody: /app

COPY docker-entrypoint.sh ./
RUN chmod +x docker-entrypoint.sh

USER nobody

ENTRYPOINT ["bash", "docker-entrypoint.sh"]
CMD ["bin/currency_watch", "start"]
