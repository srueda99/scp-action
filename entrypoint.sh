#!/bin/sh -l

if [[ "$INPUT_KEY" ]]; then
    echo -e "${INPUT_KEY}" > key
    chmod 400 key
    echo "Trying SCP process with SSH key"
    scp -P $INPUT_PORT -o StrictHostKeyChecking=no -i key $INPUT_ORIGIN "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"
else
    echo "Trying SCP process with password"
    sshpass -p $INPUT_PASSWORD scp -P $INPUT_PORT -o StrictHostKeyChecking=no $INPUT_ORIGIN "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"
fi
echo "Files successfully copied"