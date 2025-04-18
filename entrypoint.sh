#!/bin/sh -l

# Checking if the key input is not empty
if [[ "$INPUT_KEY" ]]; then
    # If it is not empty, it uses the key for the SCP
    echo -e "${INPUT_KEY}" > key.pem   # Creates a file with the key content
    chmod 400 key.pem                  # Set the key as Read-Only
    echo "Trying SCP process with SSH key"
    # Runs the SCP command
    scp -P $INPUT_PORT -o StrictHostKeyChecking=no -i key.pem -r $INPUT_ORIGIN "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"
else
    # If the key is empty, it uses the password for the SCP
    echo "Trying SCP process with password"
    # Runs the SCP command
    sshpass -p $INPUT_PASSWORD scp -P $INPUT_PORT -o StrictHostKeyChecking=no -r $INPUT_ORIGIN "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"
fi
time=$(date)
echo "-----------------------------"
echo "| Files copied successfully |"
echo "-----------------------------"
echo "time=$time" >> $GITHUB_ENV