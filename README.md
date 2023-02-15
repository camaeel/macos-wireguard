# macos-wireguard

Project guides through setting macos wireguard.

1. Install wireguard-tools: `brew install wireguard-tools`
1. generate key + show sample config: `./gen_key.sh wg0`
1. Use output of this script to prepare proper config (/usr/local/etc/wireguard/wg0.conf or /etc/wireguard/wg0.conf)
