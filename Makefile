#filter_string="temp-logs"
containername:
	#az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq .[].name
	my_array=($(az storage blob list --account-name storageaccountblob1235  --container-name staging1 --prefix "" --only-show-errors | jq -r '.[].name'))
check_string:
	@for item in "${my_array[@]}"; do \
	if [[ "$item" == *"temp-logs"* ]]; then \
		echo "$item"; \
	else \
		echo "not found"; \
	fi; \
	done

	
