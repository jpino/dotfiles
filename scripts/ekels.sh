#!/bin/bash

RESPONSE=$(curl --silent -F "key=z4j81a2Tbr0EH" -F "file=@$1" https://www.shekels.wtf/api/images/upload)

RED='\033[0;31m'
NC='\033[0m'

if [ $? -eq 0 ]; then
    echo -e "${RED}https://www.shekels.wtf/i/$(jq -r '.url' <<< "$RESPONSE").$(jq -r '.extension' <<< "$RESPONSE")${NC}"
else
    echo -e "${RED}Alice fucked it.${NC}"
    echo $RESPONSE | jq
fi

