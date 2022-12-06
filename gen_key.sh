#!/bin/zsh

usage() {
    echo "Usage: gen_key.sh interface_name"
}

if [[ $# -ne 1 ]]; then
    usage
    exit 1
fi

IFNAME=$1

PW_NAME="wireguard-$1"

PRIV_KEY=`security find-generic-password -w -s "$PW_NAME" -a "$PW_NAME" 2>/dev/null`

if [[ "$PRIV_KEY" == "" ]]  ; then 
    echo "generating new key"
    PRIV_KEY=`wg genkey` 
    security add-generic-password -w "${PRIV_KEY}" -s "$PW_NAME" -a "$PW_NAME"
else
    echo "key already exists"
fi

echo "PubKey: `echo $PRIV_KEY | wg pubkey`"
echo
echo "sample config:"
sed "s|PW_NAME|$PW_NAME|g" example.config
