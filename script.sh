#!/bin/bash
my_array=($(az storage blob list --account-name "$1" --container-name "$2" --prefix "" --only-show-errors | jq -r '.[].name'))
# Read the input string
#read -p "Enter the filter string: " filter_string

#my_array=($(your_command | jq -r '.[]'))

# Flag variable to track if matching directories are found
found_directories=false

# Iterate over the array and process each item
for item in "${my_array[@]}"; do
  # Check if the item contains the filter string
  if [[ "$item" == *"$3"* ]]; then
    echo "$item"
    found_directories=true
    # Perform additional operations on the matching directory
    az storage blob delete --account-name "$1" --container-name "$2" --name "$item"
    #"{$item} is deleted"
    #found_directories=true
  fi
done

# Check if no matching directories were found
if [ "$found_directories" = false ]; then
  echo "No directories matching the filter string were found."
fi
