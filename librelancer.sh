#!/bin/bash
echo "Starting script..."

# Define the path to your .json file
CONFIG_FILE="/usr/local/bin/librelancer-2024.06.3-ubuntu-amd64/llserver.json"
echo "Creating config file at $CONFIG_FILE"

# Create the .json content using environment variables
cat <<EOF > "$CONFIG_FILE"
{
  "ServerName": "$SERVERNAME",
  "ServerDescription": "$SERVERDESCRIPTION",
  "FreelancerPath": "$FREELANCERPATH",
  "LoginUrl": "$LOGINURL",
  "DatabasePath": "$DATABASEPATH",
  "Port": "$PORT"
}
EOF

if [ $? -ne 0 ]; then
    echo "Failed to create config file"
    exit 1
fi

echo "Config file created"

cat $CONFIG_FILE

echo "Starting Librelancer Server."
exec /usr/local/bin/librelancer-2024.06.3-ubuntu-amd64/LLServer
