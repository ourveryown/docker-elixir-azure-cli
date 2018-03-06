FROM microsoft/azure-cli
FROM elixir:1.6.1

# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*
  
RUN pip install --no-cache-dir --upgrade pip wheel jmespath-terminal pyopenssl
RUN apt-get -y install bash make gcc libffi-dev libssl-dev
RUN pip install azure-cli

WORKDIR /

CMD bash
