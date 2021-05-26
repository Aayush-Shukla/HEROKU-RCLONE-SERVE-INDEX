FROM nginx:1.19.6
RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget\
    && apt install fuse -y \
    && apt install unzip -y \
    && apt install python -y
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone
RUN mkdir dmount

COPY megatools /megatools
RUN chmod 755 /megatools
COPY entrypoint.sh /entrypoint.sh
#COPY developeranaz-rc.zip /developeranaz-rc.zip
#COPY rclone.conf /.config/rclone/rclone.conf
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
