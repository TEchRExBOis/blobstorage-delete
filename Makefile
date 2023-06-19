filter_string="temp-logs"
containername:
	az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq .[].name
	found_directories=false
	for item in "${my_array[@]}"; do \
  # Check if the item contains the filter string
  		if [[ "$item" == *"$filter_string"* ]]; then \
    			echo "$item"
    			found_directories=true
    # Perform additional operations on the matching directory
    			az storage blob delete --account-name storageaccountblob1235 --container-name staging1 --name "$item"
    #"{$item} is deleted"
    #found_directories=true
  		fi
	done
	if [ "$found_directories" = false ]; then
  		echo "No directories matching the filter string were found."
	fi
	
