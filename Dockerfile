FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget curl fuse unzip sudo -y
RUN curl https://rclone.org/install.sh | sudo bash
RUN mkdir /emby/001 /emby/002 /emby/003 /root/.config/rclone
ADD /rcl/rclone.conf /root/.config/rclone/rclone.conf
RUN rclone mount gdlw002:/ /emby/001 --umask 0000 --default-permissions --allow-non-empty --allow-other --buffer-size 32M --dir-cache-time 12h --vfs-read-chunk-size 64M --vfs-read-chunk-size-limit 1G
RUN rclone mount gdyh002:/ /emby/002 --umask 0000 --default-permissions --allow-non-empty --allow-other --buffer-size 32M --dir-cache-time 12h --vfs-read-chunk-size 64M --vfs-read-chunk-size-limit 1G
RUN rclone mount gdyh003:/ /emby/003 --umask 0000 --default-permissions --allow-non-empty --allow-other --buffer-size 32M --dir-cache-time 12h --vfs-read-chunk-size 64M --vfs-read-chunk-size-limit 1G
RUN wget https://github.com/MediaBrowser/Emby.Releases/releases/download/4.6.7.0/emby-server-deb_4.6.7.0_amd64.deb
RUN dpkg -i emby-server-deb_4.6.7.0_amd64.deb
RUN rm -rf /var/lib/emby
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CKBCCknQ9KWkTe7B20tLOyxz8MZ40ZbC' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CKBCCknQ9KWkTe7B20tLOyxz8MZ40ZbC" -O emby.zip && rm -rf /tmp/cookies.txt
RUN unzip -o emby.zip -d /
RUN chown -R emby:emby /var/lib/emby
RUN rm emby-server-deb_4.6.7.0_amd64.deb emby.zip
EXPOSE 8096
CMD pkill -9 Emby
CMD /opt/emby-server/bin/emby-server &
