FROM cbsan/android-sdk

LABEL maintainer="Cristian B. Santos <cbsan.dev@gmail.com>"
LABEL describle="Flutter development environment"

ENV FLUTTER_URL=https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.0.5-stable.tar.xz
ENV PATH=${PATH}:/opt/flutter/bin

RUN apt update && apt install -y \
  git xz-utils \
&& curl -fsSL ${FLUTTER_URL} -o /tmp/flutter.tar.xz \
&& tar xf /tmp/flutter.tar.xz -C /opt \
&& rm -f /tmp/flutter.tar.xz \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf ${ANDROID_HOME}/avd/* \
&& flutter precache \
&& flutter config --no-analytics \
&& flutter emulators --create --name emu${ANDROID_EMULATOR_VERSION} \
&& for f in ${ANDROID_HOME}/avd/*.avd/config.ini; do echo 'hw.keyboard=yes' >>  ${f}; done \
&& for f in ${ANDROID_HOME}/avd/*.avd/config.ini; do echo 'hw.ramSize=3072' >>  ${f}; done \
&& for f in ${ANDROID_HOME}/avd/*.avd/config.ini; do sed -i 's/hw.lcd.density=.*/hw.lcd.density=320/'  ${f}; done \
&& for f in ${ANDROID_HOME}/avd/*.avd/config.ini; do sed -i 's/hw.lcd.height=.*/hw.lcd.height=1334/'  ${f}; done \
&& for f in ${ANDROID_HOME}/avd/*.avd/config.ini; do sed -i 's/hw.lcd.width=.*/hw.lcd.width=750/'  ${f}; done 

WORKDIR /usr/src