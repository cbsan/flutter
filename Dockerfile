FROM cbsan/android-sdk

LABEL maintainer="Cristian B. Santos <cbsan.dev@gmail.com>"
LABEL describle="Flutter development environment"

ENV FLUTTER_URL=https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.0.4-stable.tar.xz
ENV PATH=${PATH}:/opt/flutter/bin

RUN apt update && apt install -y \
  git xz-utils \
&& curl -fsSL ${FLUTTER_URL} -o /tmp/flutter.tar.xz \
&& tar xf /tmp/flutter.tar.xz -C /opt \
&& rm -f /tmp/flutter.tar.xz \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf ~/.android/avd/* \
&& flutter precache \
&& flutter config --no-analytics \
&& flutter emulators --create --name emu${ANDROID_EMULATOR_VERSION} \
&& for f in ~/.android/avd/*.avd/config.ini; do echo 'hw.keyboard=yes' >>  ${f}; done