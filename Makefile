AZ_CLI_DELETE_COMMAND := az storage blob delete --account-name storageaccountblob1235 --only-show-errors --container-name staging1 --name
AZ_CLI_COMMAND := az storage blob list --account-name storageaccountblob1235 --container-name staging1 --prefix "" --only-show-errors
FILTER_STRING := temp-logs
target:
	$(foreach item,$(shell $(AZ_CLI_COMMAND) | jq -r '.[].name' | grep $(FILTER_STRING)) && echo "Dir to Delete: $(item)", $(AZ_CLI_DELETE_COMMAND) "$(item)";)
