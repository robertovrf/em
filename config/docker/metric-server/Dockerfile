FROM ubuntu:18.10

COPY ./dana ./home/roberto/dana 
COPY ./interscity_dana_project ./home/roberto/interscity_dana_project
ENV DANA_HOME=/home/roberto/dana/
ENV PATH="${PATH}:/home/roberto/dana/"
WORKDIR /home/roberto/interscity_dana_project/hpa/

ENTRYPOINT ["/bin/bash", "./../scripts/bash/metric-server.sh"]

