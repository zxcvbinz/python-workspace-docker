FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install vim wget curl build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev
RUN apt-get -y install ffmpeg libsm6 libxext6
RUN apt-get -y install zbar-tools
RUN apt-get -y install qrencode
## INSTALL PYTHON
WORKDIR "/home/Python"
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
RUN tar -xf Python-3.9.1.tgz
WORKDIR "/home/Python/Python-3.9.1"
RUN ./configure --enable-optimizations 
RUN make -j 2
RUN make altinstall
RUN echo 'alias python="python3.9"' >> ~/.bashrc
RUN echo 'alias pip="pip3.9"' >> ~/.bashrc

## STOP PYTHON
WORKDIR "/"

##ADD DEPENDENCIES
RUN pip3.9 install opencv-python
RUN pip3.9 install base45
RUN pip3.9 install flynn
RUN pip3.9 install qrcode
RUN pip3.9 install cose
RUN pip3.9 install image
RUN pip3.9 install pyzbar
