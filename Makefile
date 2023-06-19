filter_string="temp-logs"
containername:
	#az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq .[].name
	my_array=($(az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'))
	for item in "${my_array[@]}"; do
  # Check if the item contains the filter string
  	@if [[ "$item" == *"$filter_string"* ]]; then
    	echo "$item"
    #found_directories=true
  	fi
done

	
