#!/bin/bash

# Check if a domain search query is provided
if [ "$#" -ne 1 ]; then
    printf "Usage:\n\t$0 '<*.domain.com>'\n\t$0 '<domain.*>'\n"
    exit 1
fi

# Set the Netlas API key (you can also set this as an environment variable or in the config file)
export NETLAS_API_KEY="1Hy0DesVvqlAHQFqkBEWYElPu9YyxEdG"

# Download all available results from Netlas and process with jq
netlas download "domain:$1" --all --datatype domain --include "domain" \
    | jq -r ".data.domain"
