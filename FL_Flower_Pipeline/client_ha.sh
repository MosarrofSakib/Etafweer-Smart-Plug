#!/bin/bash

#activate the python environment
source env/bin/activate

TODAY=$(date +%Y-%m-%d)
HA_PATH="SSFL/Data/sensor_data_${TODAY}.csv"
CLIENT_ID=1

echo "Using data file: $HA_PATH"

if [ ! -f "$HA_PATH" ]; then
    echo "File not found: $HA_PATH"
    exit 1
fi

python client.py \
    --client_id="$CLIENT_ID" \
    --stage Post \
    --raw_data_path "$HA_PATH"