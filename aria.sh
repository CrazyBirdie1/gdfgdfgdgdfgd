export MAX_DOWNLOAD_SPEED=0
tracker_list=$(curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',')
export MAX_CONCURRENT_DOWNLOADS=15
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port 6800 --check-certificate=false \
   --max-connection-per-server=10 --rpc-max-request-size=1024M --lowest-speed-limit=<1M> \
   --bt-tracker="[$tracker_list]" --enable-dht=false --disable-ipv6=true --bt-max-peers=0 --seed-time=0.01 --bt-stop-timeout=300 --bt-tracker-connect-timeout=300 --min-split-size=10M --peer-id-prefix=-qB4205- --user-agent=qBittorrent/4.2.5 \
   --follow-torrent=mem --split=10 \
   --daemon=true --allow-overwrite=true --max-overall-download-limit=$MAX_DOWNLOAD_SPEED \
   --max-overall-upload-limit=1K --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS
