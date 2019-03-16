FROM ubuntu:18.04
LABEL maintainer "Noriki Nakamura <bynn_chapu@tencho-lab.net>"

ARG INSTALL_DIR="/root/esp"
ARG ESP32_TOOL_DIR="$INSTALL_DIR/xtensa-esp32-elf"
ARG ESP32_TOOL_TAR_URL="https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz"
ARG ESP32_TOOL_TAR_PATH="$INSTALL_DIR/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz"
ARG IDF_PATH="$INSTALL_DIR/esp-idf"

RUN apt update && apt install -y gcc git wget make libncurses-dev flex bison \
    gperf python python-pip python-setuptools python-serial \
    python-cryptography python-future python-pyparsing

RUN mkdir $INSTALL_DIR && wget -P $INSTALL_DIR $ESP32_TOOL_TAR_URL && \
    tar zxvf $ESP32_TOOL_TAR_PATH -C $INSTALL_DIR && rm $ESP32_TOOL_TAR_PATH
RUN echo "export PATH=\"$INSTALL_DIR/xtensa-esp32-elf/bin:$PATH\"" >> $HOME/.profile && \
    echo "export IDF_PATH=\"$IDF_PATH\"" >> $HOME/.profile

RUN git clone --recursive https://github.com/espressif/esp-idf.git $IDF_PATH
RUN python -m pip install --user -r $IDF_PATH/requirements.txt

WORKDIR /root
CMD /bin/bash --login
