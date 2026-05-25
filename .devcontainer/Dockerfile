# SPDX-FileCopyrightText: 2026 Théo Magne <theo.magne@allcircuits.com>
#
# SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

FROM debian:13.4

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install base dependencies
RUN apt-get update && apt-get install -y \
    # Build essentials
    build-essential \
    cmake \
    ninja-build \
    curl \
    git \
    wget \
    unzip \
    xz-utils \
    sudo \
    # C/C++ tools
    gcc \
    g++ \
    gdb \
    clang \
    clang-format \
    clang-tidy \
    # Libraries for Flutter Linux desktop
    libsecret-1-dev \
    libgtk-3-dev \
    libblkid-dev \
    liblzma-dev \
    libglu1-mesa \
    lld \
    locales \
    binutils \
    zip \
    vim && \
    rm -rf /var/lib/apt/lists/*

# Set locale
RUN apt-get update && apt-get install -y \
    locales \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN git config --global core.editor "vim"

# Manually download plantuml.jar to have the latest version
ARG PLANTUML_VERSION=1.2025.7
RUN mkdir -p /opt/plantuml \
    && wget https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar -O /opt/plantuml/plantuml.jar \
    && chmod +x /opt/plantuml/plantuml.jar \
    && ln -s /opt/plantuml/plantuml.jar /usr/local/bin/plantuml.jar

# =============================================================================
# User setup
# =============================================================================

ARG USERNAME=debian

RUN useradd -m $USERNAME \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && usermod -a -G dialout,plugdev $USERNAME

# =============================================================================
# Flutter Stage
# =============================================================================

ARG FLUTTER_VERSION=3.41.9

ENV WORKSPACE_DIR=/workspace

ENV FLUTTER_HOME=/home/${USERNAME}/flutter
ENV ANDROID_SDK_ROOT=/home/${USERNAME}/android-sdk
ENV ANDROID_HOME=${ANDROID_SDK_ROOT}
ENV PATH=${PATH}:${FLUTTER_HOME}/bin:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools

# Allow user to run sudo without password
USER root
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Switch to user for flutter installation
USER ${USERNAME}

# Download and install Flutter
RUN git clone https://github.com/flutter/flutter.git -b ${FLUTTER_VERSION} --depth 1 ${FLUTTER_HOME} \
    && flutter precache --linux \
    && flutter config --no-analytics \
    && flutter config --enable-linux-desktop \
    && dart --disable-analytics

# Switch back to root user
USER root

# =============================================================================
# Android SDK Stage
# =============================================================================

ARG ANDROID_CMDTOOLS_BUILD=11076708
ARG ANDROID_BUILD_TOOLS_VERSION=36.0.0
ARG ANDROID_PLATFORM_VERSION=36

# Install Java JDK 21 (required for Android SDK tools)
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

USER ${USERNAME}

# Download and install Android command-line tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
    && wget "https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_CMDTOOLS_BUILD}_latest.zip" \
    -O /tmp/cmdtools.zip \
    && unzip /tmp/cmdtools.zip -d /tmp/cmdtools_extract \
    && mv /tmp/cmdtools_extract/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/latest \
    && rm -rf /tmp/cmdtools_extract /tmp/cmdtools.zip

# Accept Android SDK licenses and install required SDK packages
RUN yes | sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" --licenses > /dev/null \
    && sdkmanager --sdk_root="${ANDROID_SDK_ROOT}" \
    "platform-tools" \
    "platforms;android-${ANDROID_PLATFORM_VERSION}" \
    "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

# Configure Flutter for Android development
RUN flutter config --android-sdk ${ANDROID_SDK_ROOT} \
    && yes | flutter doctor --android-licenses > /dev/null 2>&1 || true \
    && flutter precache --android

USER root

# =============================================================================
# Reuse installations
# =============================================================================
# Install pipx
RUN apt-get update && apt-get install -y \
    pipx \
    && rm -rf /var/lib/apt/lists/*

# Switch to user to install reuse in a user environment
USER ${USERNAME}
RUN pipx install reuse \
    && pipx ensurepath

# Switch back to root user
USER root

# Set up workspace
WORKDIR ${WORKSPACE_DIR}
RUN chown -R ${USERNAME}:${USERNAME} ${WORKSPACE_DIR}

# Switch to user
USER ${USERNAME}

# Set default shell
SHELL ["/bin/bash", "-c"]

# Verify installations
RUN echo "=== Development Environment ===" \
    && echo "Flutter: $(flutter --version | head -1)" \
    && echo "================================"

# Default command
CMD ["/bin/bash"]
