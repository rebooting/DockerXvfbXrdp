FROM rebooting/xvfbsid:latest
COPY settings/keyboard /etc/default/keyboard
RUN apt-get install -y xrdp 

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get update

RUN apt-get install -y libboost-all-dev g++ git make zlib1g-dev libboost-all-dev libssl-dev cmake clang++-3.8 libcpprest-dev 
RUN apt-get install -y code libasound2


WORKDIR /buildhome
VOLUME ["/buildhome"]
ENV HOME /buildhome
COPY settings/.bashrc /buildhome
EXPOSE 3389

COPY settings/xrdp.ini /etc/xrdp/xrdp.ini
CMD ["/usr/bin/chmod", "755", "/etc/xrdp/xrdp.ini"]



ADD scripts/xvfb-runner /usr/bin/xvfb-runner

RUN chmod +x /usr/bin/xvfb-runner

#EXPOSE 7800


CMD /bin/bash /usr/bin/xvfb-runner
