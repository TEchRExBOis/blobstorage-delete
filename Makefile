AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
FILTER_STRING := temp-logs 

target:
	@my_array=($$( $(AZ_CLI_COMMAND) | jq -r '.[].name' )); \
	echo "my_array=($$(foreach item,$${my_array},$(item)))"; \
	found_directories=false; \
	$(foreach item,$${my_array}, \
		if [[ "$$(item)" == *"${FILTER_STRING}"* ]]; then \
			echo "$$(item)"; \
			found_directories=true; \
			#az storage blob delete --account-name storageaccountblob1235 --container-name staging1 --name "$$(item)"; \
		fi; \
	); \
	if [ "$$found_directories" = false ]; then \
		echo "No directories matching the filter string were found."; \
	fi
