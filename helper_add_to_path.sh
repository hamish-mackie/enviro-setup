LINE_TO_ADD='PATH=$PATH:~/bin'
FILE="$HOME/.bashrc"

# Check if the line already exists
if ! grep -Fq "$LINE_TO_ADD" "$FILE"; then
    echo "$LINE_TO_ADD" >> "$FILE"
    echo "Added '$LINE_TO_ADD' to $FILE"
else
    echo "'$LINE_TO_ADD' already present in $FILE"
fi
