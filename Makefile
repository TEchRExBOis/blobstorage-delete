AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
FILTER_STRING := temp-logs
AZ_CLI_DELETE_COMMAND := az storage blob delete --account-name storageaccountblob1235 --container-name staging1 --name --only-show-errors
target:
	@my_array=$$( $(AZ_CLI_COMMAND) | jq -r '.[].name' | grep $(FILTER_STRING) ); \
	echo "Sub Dir to Delete: $${my_array}"
	$(foreach item,$(shell $(AZ_CLI_COMMAND) | jq -r '.[].name' | grep $(FILTER_STRING)), $(AZ_CLI_DELETE_COMMAND) "$(item)";)
