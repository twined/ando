## Build and update hub image

```
$ docker build -t twined/ando:1.0 .
$ docker push twined/ando:1.0
```

## Alpine versions

```
1.0 -> - Alpine 3.4
```

## Example Dockerfile

```
FROM twined/ando:1.0

MAINTAINER Twined Networks <mail@twined.net>

COPY . /app
WORKDIR /app

ENV MIX_ENV prod

RUN mix clean
RUN mix deps.clean --all
RUN mix deps.get
RUN mix deps.compile

COPY package.json yarn.lock /app/
RUN yarn --pure-lockfile
RUN node_modules/.bin/brunch build -p

RUN mix phoenix.digest
RUN mix compile
RUN mix release --verbosity=verbose
```
