#!/bin/bash

# Little CLI AI Bash Script
# A tool to process data on the command line using OpenAI API.
# Can be used to organize information or explain data in a readable format that can be added to
# to vulnerability reports, playbooks, checklists, or used to ask a simple question.
# Configuration: $OKEY is the assigned variable for OpenAI API key. Leave or change. 
# Requires jq: sudo apt install jq
# jq link: https://jqlang.github.io/jq/

# Define system content and model
systemContent="You are a helpful assistant. Explain the data provided professionally. Regurgitate\
the data back in an organized format."
model="gpt-4o-mini"

# Check if command-line arguments are provided
if [ $# -gt 0 ]; then
    varNameUnedit="$@"
elif [ -p /dev/stdin ]; then
    varNameUnedit=""
    while IFS= read -r line; do
        varNameUnedit+="$line "
    done
else
    echo "No input was provided. Exiting."
    exit 1
fi

# Convert input to lowercase
varname=$(echo "$varNameUnedit" | tr '[:upper:]' '[:lower:]')

# Make API request
response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OKEY" \
    -d '{
        "model": "'"${model}"'",
        "messages": [
            {
                "role": "system",
                "content": "'"${systemContent}"'"
            },
            {
                "role": "user",
                "content": "'"${varname}"'"
            }
        ]
    }' | jq -r '.choices[].message.content')

# Output the response
echo "$response"
