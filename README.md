## Build and update hub image

```
$ docker build -t twined/ando:2.1 .
$ docker push twined/ando:2.1
```

## Alpine versions

```
1.0 -> - Alpine 3.4
2.0 -> - Alpine 3.5
```

## Example Dockerfile

```
FROM twined/ando:2.1

MAINTAINER Twined Networks <mail@twined.net>

COPY . /opt/app
WORKDIR /opt/app

ENV MIX_ENV prod

RUN mix clean
RUN mix deps.clean --all
RUN mix deps.get
RUN mix deps.compile

COPY package.json yarn.lock /opt/app/assets
RUN cd assets/ && yarn --pure-lockfile
RUN cd assets/ && node_modules/.bin/brunch build -p

RUN mix phoenix.digest
RUN mix compile
RUN mix release --verbosity=verbose
```
