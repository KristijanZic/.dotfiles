echo "You have 8 seconds to input a number:"
echo "Please enter a number within the specified time."
echo "Waiting for user input..."

countdown=8

while [ $countdown -gt 0 ]; do
    printf "\r$countdown seconds remaining...   "
    read -t 1 -n 1 input_char
    if [ $? -eq 0 ]; then
        break
    fi
    ((countdown--))
done

echo -e "\r"

if [ -n "$input_char" ]; then
    echo "User input: $input_char"
else
    echo "Timeout reached. No input received."
fi
