## Build and update hub image

```
$ docker build -t twined/ando:2.0 .
$ docker push twined/ando:2.0
```

## Alpine versions

```
1.0 -> - Alpine 3.4
2.0 -> - Alpine 3.5
```

## Example Dockerfile

```
FROM twined/ando:2.0

MAINTAINER Twined Networks <mail@twined.net>

COPY . /opt/app
WORKDIR /opt/app

ENV MIX_ENV prod

RUN mix clean
RUN mix deps.clean --all
RUN mix deps.get
RUN mix deps.compile

COPY package.json yarn.lock /opt/app/
RUN yarn --pure-lockfile
RUN node_modules/.bin/brunch build -p

RUN mix phoenix.digest
RUN mix compile
RUN mix release --verbosity=verbose
```
