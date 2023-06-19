AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
FILTER_STRING := temp-logs

target:
	@my_array=$$( $(AZ_CLI_COMMAND) | jq -r '.[].name' | grep $(FILTER_STRING) ); \
	echo "$${my_array}"
        az storage blob delete --account-name storageaccountblob1235 --container-name staging1 --name "$${my_array}"
