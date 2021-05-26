#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
rclone version
rclone listremotes
#refreshing Rclone
wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf'
rclone version
rclone listremotes

rclone mount $CLOUDNAME: /dmount
rclone serve http $CLOUDNAME: --addr :$PORT --vfs-read-chunk-size 128M
./megatools dl $link --path ./dmount
rclone copy ./dmount $CLOUDNAME
