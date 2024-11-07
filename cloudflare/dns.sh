#!/bin/bash

# Cloudflare API credentials
# CF_EMAIL="<your-email>"
# CF_API_TOKEN="<your-api-token>"
# CF_ZONE_ID="<your-zone-id>"

CF_API_BASE_URL="https://api.cloudflare.com/client/v4"

# Function to list DNS records
list_dns() {
    local name="$1"
    local content="$2"
    local cols="$3"
    
    local url="${CF_API_BASE_URL}/zones/${CF_ZONE_ID}/dns_records"
    
    # Build the query parameters
    local query_params=""
    [ -n "$name" ] && query_params="&name=$name"
    [ -n "$content" ] && query_params="$query_params&content=$content"

    # Make the API request
    response=$(curl -s -X GET "$url?$query_params" \
        -H "X-Auth-Email: $CF_EMAIL" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json")

    # Parse the response with jq
    if [ -n "$cols" ]; then
        echo "$response" | jq -r ".result[] | [$cols] | @tsv"
    else
        echo "$response" | jq -r '.result[] | [.id, .type, .name, .content, .proxied, .ttl] | @tsv'
    fi
}

# Function to insert a new DNS record
insert_dns() {
    local name="$1"
    local content="$2"
    local type="$3"
    local proxied="$4"
    
    local url="${CF_API_BASE_URL}/zones/${CF_ZONE_ID}/dns_records"

    # Make the API request
    response=$(curl -s -X POST "$url" \
        -H "X-Auth-Email: $CF_EMAIL" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json" \
        --data '{
            "type": "'"$type"'",
            "name": "'"$name"'",
            "content": "'"$content"'",
            "proxied": '"$proxied"'
        }')

    # Output the response
    echo "$response" | jq .  # Pretty-print the JSON response
}

# Function to update an existing DNS record
update_dns() {
    local id="$1"
    local name="$2"
    local content="$3"
    local type="$4"
    local proxied="$5"
    
    local url="${CF_API_BASE_URL}/zones/${CF_ZONE_ID}/dns_records/$id"

    # Make the API request
    response=$(curl -s -X PUT "$url" \
        -H "X-Auth-Email: $CF_EMAIL" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json" \
        --data '{
            "type": "'"$type"'",
            "name": "'"$name"'",
            "content": "'"$content"'",
            "proxied": '"$proxied"'
        }')

    # Output the response
    echo "$response" | jq .  # Pretty-print the JSON response
}

# Function to delete a DNS record
delete_dns() {
    local id="$1"
    
    local url="${CF_API_BASE_URL}/zones/${CF_ZONE_ID}/dns_records/$id"

    # Make the API request
    response=$(curl -s -X DELETE "$url" \
        -H "X-Auth-Email: $CF_EMAIL" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json")

    # Output the response
    echo "$response" | jq .  # Pretty-print the JSON response
}

# Main script logic based on command arguments
case "$1" in
    list|l)
        shift
        list_dns "$@"
        ;;
    insert|create|i|c)
        shift
        insert_dns "$@"
        ;;
    update|u)
        shift
        update_dns "$@"
        ;;
    delete|d|rm)
        shift
        delete_dns "$@"
        ;;
    *)
        echo "Usage: $0 {list|insert|create|update|delete} [arguments]"
        exit 1
        ;;
esac
