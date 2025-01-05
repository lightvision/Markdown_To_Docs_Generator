# #############################################################################
#
# Get the plantuml.jar
#
FROM plantuml/plantuml AS plantbase

# DONE ###


# #############################################################################
#
# Build GRAPHVIZ and DOT
#
FROM debian:stable-slim AS dotbuilder
ARG GRAPHVIZ_VERSION
ENV GRAPHVIZ_BUILD_DIR=/tmp/graphiz-build

RUN <<EOF
# Install development libs for GRAPHVIZ with DOT
apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        build-essential \
        jq \
        libexpat1-dev \
        libgd-dev \
        zlib1g-dev \
        ca-certificates \
        libtool
EOF

RUN <<EOF
# Get and build GRAPHVIZ with DOT
mkdir -p $GRAPHVIZ_BUILD_DIR && \
    cd $GRAPHVIZ_BUILD_DIR && \
    GRAPHVIZ_VERSION=${GRAPHVIZ_VERSION:-$(curl -s https://gitlab.com/api/v4/projects/4207231/releases/ | jq -r '.[] | .name' | sort -V -r | head -1)} && \
    curl -o graphviz.tar.gz https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/${GRAPHVIZ_VERSION}/graphviz-${GRAPHVIZ_VERSION}.tar.gz && \
    tar -xzf graphviz.tar.gz && \
    cd graphviz-$GRAPHVIZ_VERSION && \
    ./configure && \
    make && \
    make install
EOF

# DONE ###


# #############################################################################
#
# Build Final Image
#
# Contents: Pandoc with Latex, PlantUML with DOT, make
#
FROM debian:stable-slim
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN <<EOF
# Install end configure locales
sed -i 's/main/main contrib/g' /etc/apt/sources.list.d/debian.sources && \
apt update && \
apt-get install --no-install-recommends -y \
locales && \
sed -i 's/^# *\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen
EOF

RUN <<EOF
# Install and configure fonts
apt install --no-install-recommends -y \
fontconfig ttf-mscorefonts-installer && \
fc-cache -f -v
EOF

RUN <<EOF
# Install additionally packages that will be removed
apt install --no-install-recommends -y \
curl \
jq
EOF

RUN <<EOF
# Install packages that we keep
# Installing Java and hared libraries need it for PlantUML
apt install -y openjdk-17-jre-headless \
libgd3 libjpeg62-turbo libpng16-16 \
make \
ca-certificates
EOF

RUN <<EOF
# Install and configure *tex package need it by Pandoc
apt install --no-install-recommends -y \
texlive texlive-xetex texlive-luatex texlive-fonts-recommended
EOF

RUN <<EOF
# Install Pandoc
LATEST_RELEASE=$(curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
| jq -r '.assets[] | select(.name | test("amd64.deb$")) | .browser_download_url') && \
cd /tmp/ && \
wget $LATEST_RELEASE && \
apt install -y --no-install-recommends ./pandoc-*.deb && \
rm ./pandoc-*.deb
EOF


# Create plantuml executable
# noinspection ShellScriptUnresolvedVariable
COPY --chmod=0755 <<-"EOF" /usr/bin/plantuml
#!/bin/sh
#
# This script was copied from the default PlantUML Debian Install
# Copyright (C) 2010 Ilya Paramonov <ivparamonov@gmail.com>
#
if [ -n "${JAVA_HOME}" ] && [ -x "${JAVA_HOME}/bin/java" ] ; then
    JAVA="${JAVA_HOME}/bin/java"
elif [ -x /usr/bin/java ] ; then
    JAVA=/usr/bin/java
    JAVA_HOME=$(dirname $(realpath "${JAVA}"))/..
else
    echo Cannot find JVM >&2
    exit 1
fi

HEADLESS=
if [ -z "$DISPLAY" ] || ! [ -e "${JAVA_HOME}/lib/libawt_xawt.so" ] ; then
    HEADLESS=-Djava.awt.headless=true
fi

exec "$JAVA" -Djava.net.useSystemProxies=true $HEADLESS -jar /opt/plantuml.jar "$@"
EOF

# Get the plantuml.jar in the final image
COPY --from=plantbase /opt/plantuml.jar /opt/plantuml.jar

# Get DOT and GRAPHVIZ in the final image
COPY --from=dotbuilder /usr/local/bin/ /usr/local/bin/
COPY --from=dotbuilder /usr/local/lib/ /usr/local/lib/
COPY --from=dotbuilder /usr/local/share/doc/ /usr/local/share/doc/
COPY --from=dotbuilder /usr/local/share/graphviz/ /usr/local/share/graphviz/

RUN <<EOF
# Cleanup un-necessary packages
apt purge --remove -y \
curl jq && \
apt autoremove -y &&
apt clean && \
rm -rf /var/lib/apt/lists/* && \
ldconfig
EOF

# Setup WORKDIR and ENTRYPOINT
#ENV ${WORKDIR:-/data}
WORKDIR ${WORKDIR}
ENTRYPOINT ["/bin/bash"]