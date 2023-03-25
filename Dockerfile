FROM python:3-alpine

LABEL "com.github.actions.name"="YAPF Python Code Formatting Check"
LABEL "com.github.actions.description"="Run YAPF to check that your python code if correctly formatted."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="106a4e"
LABEL "repository"="https://github.com/AlexanderMelde/yapf-action"
LABEL "homepage"="https://github.com/AlexanderMelde/yapf-action"
LABEL "maintainer"="Alexander Melde <alexander@melde.net>"

ENV REVIEWDOG_VERSION=v0.14.1

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN pip install --upgrade pip
RUN pip install yapf toml

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
